import 'package:flutter/material.dart';



class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmoount;
  final double spendingPctOfTotal;  // percentage

  ChartBar(this.label, this.spendingAmoount, this.spendingPctOfTotal);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 12,
          child: FittedBox(child: Text("\$${spendingAmoount.toStringAsFixed(0)}")),
        ),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 12,
          child: Stack(children: <Widget>[
            Container(decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              color: Color.fromRGBO(220, 220, 220, 1),
              borderRadius: BorderRadius.circular(12),
            )),
            FractionallySizedBox(
              heightFactor: spendingPctOfTotal,
              child: Container(decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
              )),
            ),
          ]),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}