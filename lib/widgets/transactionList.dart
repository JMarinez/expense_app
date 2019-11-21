import 'package:flutter/material.dart';

import 'package:expense_app/models/transaction.dart';
import 'transactionItem.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 1,
      title: "New shoes",
      amount: 599.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      title: "New game",
      amount: 2999.99,
      date: DateTime.now(),
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map((transaction) {
        return TransactionItem(
          id: transaction.id,
          title: transaction.title,
          amount: transaction.amount,
          date: transaction.date,
        );
      }).toList(),
    );
  }
}
