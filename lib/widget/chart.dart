import 'dart:core';
import 'package:fdtcg_expenses/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class Chart extends StatelessWidget {
  Chart({this.recentTransactions});
  final List<Transaction> recentTransactions;

  /// [For multiple 7 bars]
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;
        /// [for loop]
        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day
              && recentTransactions[i].date.month == weekDay.month
              && recentTransactions[i].date.year  == weekDay.year) {
                    totalSum += recentTransactions[i].amount;
          }
        }
        print(DateFormat.E(weekDay));   /// [Check content of return]
        print(totalSum);

        return {"day": DateFormat.E(weekDay), "amount": totalSum};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[

        ],
      ),
      


    );
  }
}