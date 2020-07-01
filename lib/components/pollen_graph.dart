import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PollenInfo extends StatelessWidget {
  final List<Map> pollenResult;
  PollenInfo({this.pollenResult});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Quick Pollen Summary', style: kPollenQuickStyle),
          SizedBox(height: 25.0),
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Icon(
                MaterialCommunityIcons.sprout_outline,
                color: kHeaderColor,
                size: 35.0,
              ),
              SizedBox(width: 5.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Grass (graminales) : All year long',
                    style: kBarDayStyle,
                  ),
                  Text(
                    '${pollenResult[0]['alertLevel']} /5, ${pollenResult[0]['alertType']} risk',
                    style: kSummaryConditionStyle,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 25.0),
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Icon(
                MaterialCommunityIcons.tree_outline,
                color: kHeaderColor,
                size: 35.0,
              ),
              SizedBox(width: 5.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Trees (various species): January to April',
                    style: kBarDayStyle,
                  ),
                  Text(
                    '${pollenResult[1]['alertLevel']} /5, ${pollenResult[1]['alertType']}',
                    style: kSummaryConditionStyle,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 25.0),
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Icon(
                MaterialCommunityIcons.flower_tulip_outline,
                color: kHeaderColor,
                size: 35.0,
              ),
              SizedBox(width: 5.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Weed (urban species) : August to September',
                    style: kBarDayStyle,
                  ),
                  Text(
                    '${pollenResult[2]['alertLevel']} /5, ${pollenResult[2]['alertType']}',
                    style: kSummaryConditionStyle,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 25.0),
          ButtonTheme(
            height: 47.0,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Learn More',
                style: kPollenButtonStyle,
              ),
              color: kHeaderColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
            ),
          )
        ],
      ),
    );
  }
}
