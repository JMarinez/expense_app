import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                setState(() {
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}