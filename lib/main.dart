import 'package:expense_app/widgets/transactionList.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transactionItem.dart';
import './widgets/transactionForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  static int size = transactions.length;

  MyHomePage({this.title});

  static List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[100], //Temp
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.blue,
              child: Text("CHART"),
              elevation: 5,
            ),
          ),
          TransactionForm(),
          TransactionList(),
        ],
      ),
    );
  }
}
