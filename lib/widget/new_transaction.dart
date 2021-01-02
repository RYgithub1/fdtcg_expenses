import 'package:fdtcg_expenses/widget/user_transaction.dart';
import 'package:flutter/material.dart';



class NewTransaction extends StatelessWidget {

  /// [Define Function type]
  final Function addTx;
  NewTransaction(this.addTx);

  // const Newtransaction({Key key}) : super(key: key);
  final memoInputController = TextEditingController();
  final amountInputController = TextEditingController();


  void submitData() {     /// [2 ways]
  /// void submitData(String val) {   /// [2 ways to code with "onSubmitted: submitData,"]
    final enteredMemo = memoInputController.text;
    final enteredAmount = double.parse(amountInputController.text);

    if (enteredMemo.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      // memoInputController.text,
      // double.parse(amountInputController.text),
      enteredMemo,
      enteredAmount,
    );
  }



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
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  // onChanged: (amountValue) => amountInput = amountValue,
                  controller: amountInputController,
                  keyboardType: TextInputType.number,   /// [Set keyboardType]
                  /// onSubmitted: (val) => submitData,   /// [2 ways: Without submitData(), Only to pass a pointer]
                  // onSubmitted: submitData,   /// [2 ways]
                  onSubmitted: (_) => submitData(),   /// [2 ways]
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
                    /// [Chnage to function, submitData(){} ]
                    // addTx(
                    //   memoInputController.text,
                    //   double.parse(amountInputController.text),
                    // );
                    submitData();   /// [Just pass to Function] submitData?



                  },
                ),
              ],
            ),
          ),
        );
  }
}