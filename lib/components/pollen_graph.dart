import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PollenInfo extends StatelessWidget {
  final List<Map> pollenResult;
  PollenInfo({this.pollenResult})

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width:10.0),
              Icon(
                MaterialCommunityIcons.sprout_outline,
                color: kHeaderColor,
                size: 35.0,
              ), 
              SizedBox(width:5.0),
              Text(
                'Grass ',
                style: kBarDayStyle,),
              Text(
                '(graminales) :',
                style:kSummaryConditionStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
