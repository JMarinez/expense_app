import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transactionForm.dart';
import './transactionList.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: "New shoes",
      amount: 599.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: "New game",
      amount: 2999.99,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
