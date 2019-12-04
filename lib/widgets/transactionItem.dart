import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Function deleteTransaction;
  final String title;
  final double amount;
  final DateTime date;
  final String id;

  TransactionItem({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
    @required this.deleteTransaction,
  });

  void _removeData() {
    deleteTransaction(id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Text('\$$amount'),
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(date),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
          ),
          color: Theme.of(context).errorColor,
          onPressed: _removeData,
        ),
      ),
    );
  }
}
