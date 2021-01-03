import 'package:fdtcg_expenses/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class TransactionList extends StatelessWidget {

  /// [move to user_transaction.dart]
  // final List<Transaction> _userTransactions = [
  //   Transaction(id: "t1", title: "New Shoes", amount: 66.99, date: DateTime.now()),
  //   Transaction(id: "t2", title: "Weekly Groceries", amount: 99.66, date: DateTime.now()),
  // ];
  final List<Transaction> transactions;
  final Function deleteTransactionsFunction;   /// [coz it's function]
  TransactionList(this.transactions, this.deleteTransactionsFunction);


  /// [===== build() =====]
  @override
  Widget build(BuildContext context) {
    return Container(   /// [Containerでwrapしてheight指定->listのみscrollable]
      height: 320,
      // child: SingleChildScrollView(
      // child: Column(
        // child: ListView(
        child: transactions.isEmpty
        ? Column(children: <Widget>[
            SizedBox(height:40),
            Text(
                "No transactions added yet.",
                style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height:20),
            Container(
              height: 240,
              child: Image.asset(
                  "assets/images/waiting.png",
                  fit: BoxFit.cover,   /// [BoxFit with container max size]
              ),
            ),
        ])
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index){
              // return Card(
              //           child: Row(
              //             children: <Widget>[
              //               Container(
              //                 margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              //                 padding: EdgeInsets.all(8),
              //                 decoration: BoxDecoration(
              //                     // border: Border.all(color: Colors.green, width: 2),
              //                     border: Border.all(
              //                       // color: Colors.green,
              //                       color: Theme.of(context).primaryColorDark,  /// [Use context of primaryColor]
              //                       width: 2,
              //                     ),
              //                 ),
              //                 child: Text(
              //                     // tx.amount.toString(),
              //                     // "\$${tx.amount}",   /// [\$]
              //                     // "\$${transactions[index].amount}",
              //                     "\$${transactions[index].amount.toStringAsFixed(2)}",   /// [\$]
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 20,
              //                         color: Colors.green[900],
              //                         // color: Theme.of(context).primaryColorDark,
              //                     ),
              //                 ),
              //               ),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: <Widget>[
              //                     Text(
              //                         // tx.title,
              //                         transactions[index].title,
              //                         // style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              //                         style: Theme.of(context).textTheme.headline6,   /// [the way to use context from Root]
              //                     ),
              //                     Text(
              //                         // tx.date.toString(),
              //                         // DateFormat("yyyy/MM/dd").format(tx.date),
              //                         // DateFormat.yMMMd().format(tx.date),
              //                         DateFormat.yMMMd().format(transactions[index].date),
              //                         style: TextStyle(color: Colors.grey),
              //                     ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //       );
              /// [Card to Card(ListTile)]
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 32,
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //   decoration: BoxDecoration(
                  //     color: Theme.of(context).primaryColor,
                  //     shape: BoxShape.circle,
                  //   ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: FittedBox(child: Text("\$${transactions[index].amount}")),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text( DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(
                    color: Theme.of(context).errorColor,
                    icon: Icon(Icons.delete),
                    /// [Wanna transfer "id"]
                    onPressed: () => deleteTransactionsFunction(transactions[index].id),
                  ),


                ),
              );
            },
            // children: _userTransactions
            // children: transactions
            //     .map((tx) {
            //         return  Card(
            //             child: Row(
            //               children: <Widget>[
            //                 Container(
            //                   margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            //                   padding: EdgeInsets.all(8),
            //                   decoration: BoxDecoration(
            //                       border: Border.all(color: Colors.green, width: 2),
            //                   ),
            //                   child: Text(
            //                       // tx.amount.toString(),
            //                       "\$${tx.amount}",   /// [\$]
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 20,
            //                           color: Colors.green[900],
            //                       ),
            //                   ),
            //                 ),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: <Widget>[
            //                       Text(
            //                           tx.title,
            //                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //                       ),
            //                       Text(
            //                           // tx.date.toString(),
            //                           // DateFormat("yyyy/MM/dd").format(tx.date),
            //                           DateFormat.yMMMd().format(tx.date),
            //                           style: TextStyle(color: Colors.grey),
            //                       ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //         );
            //     })
            //     .toList(),
          ),
    );
  }
}