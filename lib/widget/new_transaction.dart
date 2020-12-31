import 'package:flutter/material.dart';



class Newtransaction extends StatelessWidget {
  // const Newtransaction({Key key}) : super(key: key);
  final memoInputController = TextEditingController();
  final amountInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Memo"),
                  // onChanged: (memoValue) {
                  //   memoInput = memoValue;
                  // },
                  controller: memoInputController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  // onChanged: (amountValue) => amountInput = amountValue,
                  controller: amountInputController,
                ),
                RaisedButton(
                  color: Colors.lightGreen[100],
                  textColor: Colors.lightGreen[900],
                  child: Text("Add Expenses"),
                  onPressed: () {
                    // print(memoInput);
                    // print(amountInput);
                    /// [by TextEdditingController]
                    print(memoInputController.text);
                    print(amountInputController.text);
                  },
                ),
              ],
            ),
          ),
        );
  }
}