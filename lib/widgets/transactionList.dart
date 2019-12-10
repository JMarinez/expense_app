import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transactionItem.dart';

class TransactionList extends StatelessWidget {
  final Function deleteTransaction;
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? LayoutBuilder(builder: (context, constraint) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraint.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/zzz.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                id: _userTransactions[index].id,
                title: _userTransactions[index].title,
                amount: _userTransactions[index].amount,
                date: _userTransactions[index].date,
                deleteTransaction: deleteTransaction,
              );
            },
            itemCount: _userTransactions.length,
          );
  }
}
