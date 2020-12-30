import 'package:fdtcg_expenses/transaction.dart';
import 'package:flutter/material.dart';


void main() {runApp(MyApp());}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'expenses',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatelessWidget {

  final List<Transaction> transactionList = [
    Transaction(id: "t1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    Transaction(id: "t2", title: "Weekly Groceries", amount: 16.66, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY EXPENSES"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              elevation: 8,
              color: Colors.lightGreen[300],
              child: Text("cahrt"),
            ),
          ),
          Column(
            children: transactionList
                .map((tx) {
                    return  Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green, width: 2),
                              ),
                              child: Text(
                                  // tx.amount.toString(),
                                  // "A: $tx" + tx.amount.toString(),
                                  // "A: ${tx.amount}",
                                  "\$${tx.amount}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.green[900],
                                  ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  Text(
                                      tx.title,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      tx.date.toString(),
                                      style: TextStyle(color: Colors.grey),
                                  ),
                              ],
                            ),
                          ],
                        ),
                    );
                })
                .toList()
          ),
        ],
      ),
    );
  }
}
