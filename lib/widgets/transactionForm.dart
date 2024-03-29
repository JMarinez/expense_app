import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function addTransaction;

  TransactionForm(this.addTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (formKey.currentState.validate()) {
      if (_selectedDate == null) {
        return;
      }

      widget.addTransaction(
        _titleController.text,
        (double.parse(_amountController.text)),
        _selectedDate,
      );
      Navigator.of(context).pop();
    }
  }

  void _precentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  onFieldSubmitted: (_) => _submitData(),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) => _submitData(),
                  validator: (value) {
                    if (value.isEmpty || double.parse(value) <= 0) {
                      return 'Please enter a valid amount';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'No date chosen yet!'
                              : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                        ),
                      ),
                      Platform.isIOS
                          ? CupertinoButton(
                              child: Text(
                                'Choose Date',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: _precentDatePicker,
                            )
                          : FlatButton(
                              textColor: Theme.of(context).primaryColor,
                              child: Text(
                                'Choose Date',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: _precentDatePicker,
                            ),
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text('Add Transaction'),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  onPressed: _submitData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
