import 'package:fdtcg_expenses/widget/user_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



// class NewTransaction extends StatelessWidget {
class NewTransaction extends StatefulWidget {
  /// [Define Function type]
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}



class _NewTransactionState extends State<NewTransaction> {
  // const Newtransaction({Key key}) : super(key: key);
  final _memoInputController = TextEditingController();
  final _amountInputController = TextEditingController();
  DateTime _selectedDate;


  void _submitData() {     /// [2 ways]
  /// void submitData(String val) {   /// [2 ways to code with "onSubmitted: submitData,"]

    if(_amountInputController.text.isEmpty) {return;}   /// [isEmptyのvalidation]

    final enteredMemo = _memoInputController.text;
    final enteredAmount = double.parse(_amountInputController.text);

    // if (enteredMemo.isEmpty || enteredAmount <= 0) {return;}
    if (enteredMemo.isEmpty || enteredAmount <= 0 || _selectedDate == null) {return;}   /// [validation]

    // addTx(
    widget.addTx(
      // memoInputController.text,
      // double.parse(amountInputController.text),
      enteredMemo,
      enteredAmount,
      _selectedDate,
    );

    /// [Need Navigator after input expenses info. Back to previous screen]
    Navigator.of(context).pop();
  }

  /// [DateTime calendar]
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    // );
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print("comm: _presentDatePicker");
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
                  controller: _memoInputController,
                  onSubmitted: (_) => _submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  // onChanged: (amountValue) => amountInput = amountValue,
                  controller: _amountInputController,
                  keyboardType: TextInputType.number,   /// [Set keyboardType]
                  /// onSubmitted: (val) => submitData,   /// [2 ways: Without submitData(), Only to pass a pointer]
                  // onSubmitted: submitData,   /// [2 ways]
                  onSubmitted: (_) => _submitData(),   /// [2 ways]
                ),


                /// [DateTime calendar]
                Container(
                  height: 60,
                  child: Row(
                    children: <Widget>[
                      Text(_selectedDate == null
                          ? "Non picked date yet"
                          : "Date: ${DateFormat.yMMMMd().format(_selectedDate)}",
                      ),
                      FlatButton(
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text("choose", style:TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: _presentDatePicker,
                      ),
                    ],
                  ),
                ),


                RaisedButton(
                  // color: Colors.lightGreen[100],
                  color: Theme.of(context).primaryColorLight,
                  // textColor: Colors.lightGreen[900],
                  textColor: Theme.of(context).primaryColorDark,
                  child: Text("Add Expenses"),
                  onPressed: () {
                    // print(memoInput);
                    // print(amountInput);
                    /// [by TextEdditingController]
                    print(_memoInputController.text);
                    print(_amountInputController.text);
                    /// [Chnage to function, submitData(){} ]
                    // addTx(
                    //   memoInputController.text,
                    //   double.parse(amountInputController.text),
                    // );
                    _submitData();   /// [Just pass to Function] submitData?


                  },
                ),
              ],
            ),
          ),
        );
  }
}