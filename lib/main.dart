// import 'package:fdtcg_expenses/model/transaction.dart';
// import 'package:fdtcg_expenses/widget/new_transaction.dart';
// import 'package:fdtcg_expenses/widget/transaction_list.dart';
import 'package:fdtcg_expenses/widget/user_transaction.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';


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
  // final List<Transaction> transactionList = [
  //   Transaction(id: "t1", title: "New Shoes", amount: 66.99, date: DateTime.now()),
  //   Transaction(id: "t2", title: "Weekly Groceries", amount: 99.66, date: DateTime.now()),
  // ];

  // String memoInput;
  // String amountInput;
  // final memoInputController = TextEditingController();
  // final amountInputController = TextEditingController();


  /// [===== build() =====]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY EXPENSES"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(    /// [Tiger Beat]
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                elevation: 8,
                color: Colors.lightGreen[300],
                child: Text("chart"),
              ),
            ),

            /// [move to new_transaction.dart]
            // Card(
            //   elevation: 4,
            //   child: Container(
            //     padding: EdgeInsets.all(8),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: <Widget>[
            //         TextField(
            //           decoration: InputDecoration(labelText: "Memo"),
            //           // onChanged: (memoValue) {
            //           //   memoInput = memoValue;
            //           // },
            //           controller: memoInputController,
            //         ),
            //         TextField(
            //           decoration: InputDecoration(labelText: "Amount"),
            //           // onChanged: (amountValue) => amountInput = amountValue,
            //           controller: amountInputController,
            //         ),
            //         RaisedButton(
            //           color: Colors.lightGreen[100],
            //           textColor: Colors.lightGreen[900],
            //           child: Text("Add Expenses"),
            //           onPressed: () {
            //             // print(memoInput);
            //             // print(amountInput);
            //             /// [by TextEdditingController]
            //             print(memoInputController.text);
            //             print(amountInputController.text);
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            /// Newtransaction(),   /// [transfer to user_transaction.dart]

            /// [move to transaction_list.dart]
            // Column(
            //   children: transactionList
            //       .map((tx) {
            //           return  Card(
            //               child: Row(
            //                 children: <Widget>[
            //                   Container(
            //                     margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            //                     padding: EdgeInsets.all(8),
            //                     decoration: BoxDecoration(
            //                         border: Border.all(color: Colors.green, width: 2),
            //                     ),
            //                     child: Text(
            //                         // tx.amount.toString(),
            //                         "\$${tx.amount}",   /// [\$]
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 20,
            //                             color: Colors.green[900],
            //                         ),
            //                     ),
            //                   ),
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: <Widget>[
            //                         Text(
            //                             tx.title,
            //                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //                         ),
            //                         Text(
            //                             // tx.date.toString(),
            //                             // DateFormat("yyyy/MM/dd").format(tx.date),
            //                             DateFormat.yMMMd().format(tx.date),
            //                             style: TextStyle(color: Colors.grey),
            //                         ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //           );
            //       })
            //       .toList()
            // ),
            /// TransactionList(),   /// [transfer to user_transaction.dart]

            UserTransaction(),

          ],
        ),
      ),

      bottomNavigationBar: new BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.timeline),
                label: 'time line',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'news',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'search',
              ),
        ],
        elevation: 4,
        // backgroundColor: Colors.green,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.lightGreen,
        currentIndex: 1,
        onTap: null,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.attach_money),
        onPressed: (){},
      ),
    );
  }
}
