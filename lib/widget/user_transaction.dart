import 'package:fdtcg_expenses/model/transaction.dart';
import 'package:fdtcg_expenses/widget/new_transaction.dart';
import 'package:fdtcg_expenses/widget/transaction_list.dart';
import 'package:flutter/material.dart';



class UserTransaction extends StatefulWidget {
  // UserTransaction({Key key}) : super(key: key);
  @override
  _UserTransactionState createState() => _UserTransactionState();
}



class _UserTransactionState extends State<UserTransaction> {

  final List<Transaction> _userTransactions = [
    Transaction(id: "t1", title: "New Shoes", amount: 66.99, date: DateTime.now()),
    Transaction(id: "t2", title: "Weekly Groceries", amount: 99.66, date: DateTime.now()),
  ];

  void _addNewTransaction(String txMemo, double txAmount){
    final newTx =  Transaction(
      title: txMemo,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState( () {
      _userTransactions.add(newTx);
    });
  }


  /// [===== build() =====]
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Newtransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}