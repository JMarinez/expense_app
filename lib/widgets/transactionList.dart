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
      child: ListView.builder(
        itemBuilder: (context, index) {
          return TransactionItem(
            id: _userTransactions[index].id,
            title: _userTransactions[index].title,
            amount: _userTransactions[index].amount,
            date: _userTransactions[index].date,
          );
        },
        itemCount: _userTransactions.length,
      ),
    );
  }
}
