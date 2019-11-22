import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: _userTransactions.map((transaction) {
            return TransactionItem(
              id: transaction.id,
              title: transaction.title,
              amount: transaction.amount,
              date: transaction.date,
            );
          }).toList(),
        ),
      ),
    );
  }
}
