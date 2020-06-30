import 'package:flutter/material.dart';
import 'constants.dart';

class ShowGraph extends StatefulWidget {
  ShowGraph({Key key}) : super(key: key);

  @override
  _ShowGraphState createState() => _ShowGraphState();
}

class _ShowGraphState extends State<ShowGraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Text('Graph',style: kSummaryConditionStyle),
    );
  }
}