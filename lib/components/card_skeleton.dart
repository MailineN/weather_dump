import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ComponentCard extends StatelessWidget {
  ComponentCard({@required this.colour, this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
        boxShadow: [
          new BoxShadow(
            color: Color(0xFFCAD4E9),
            offset: new Offset(2.0, 3.0),
          )
        ],
      ),
    );
  }
}

class HeadCard extends StatelessWidget {
  HeadCard({this.cardChild});
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0)),
        color: Color(0xFF3842C8),
      ),
    );
  }
}

class DisplayedHead extends StatelessWidget {
  DisplayedHead({this.name, this.location});
  final name;
  final location;

  @override
  Widget build(BuildContext context) {
    return HeadCard(
      //TODO : Add complex form (REDO the shape of it)
      cardChild: Column(
        children: <Widget>[
          SizedBox(height: 40.0),
          Container(
              margin: EdgeInsets.all(10.0),
              child: Text(
                'Hello $name',
                style: kTitleNumberStyle,
                textAlign: TextAlign.center,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Feather.map_pin,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              Text('$location',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Open',
                    fontSize: 15.0,
                  )),
            ],
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    Key key,
    @required this.weaIcon,
    @required this.temp,
    @required this.todayMin,
    @required this.todayMax,
    @required this.cond,
    @required this.alertLevel,
    @required this.alertType,
    @required this.plantType,
  }) : super(key: key);

  final IconData weaIcon;
  final double temp;
  final int todayMin;
  final int todayMax;
  final String cond;
  final int alertLevel;
  final String alertType;
  final String plantType;

  @override
  Widget build(BuildContext context) {
    return ComponentCard(
      colour: Colors.white,
      cardChild: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    WeatherIcons.wi_stars,
                    color: kHeaderColor,
                    size: 40.0,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$alertLevel/5',
                        style: kSummaryNumberStyle,
                      ),
                      SizedBox(width:10.0),
                      Text(
                        '$alertType',
                        style: kSummarySecondNumberStyle,
                      ),
                    ],
                  ),
                  Text(
                    '(For type $plantType)',
                    style: kSummaryConditionStyle,
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    weaIcon,
                    color: kHeaderColor,
                    size: 35.0,
                  )),
              SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '$temp °C',
                        style: kSummaryNumberStyle,
                      ),
                      SizedBox(width:15.0),
                      Text(
                        '($todayMin - $todayMax °C today)',
                        style: kSummarySecondNumberStyle,
                      ),
                    ],
                  ),
                  Text(
                    '$cond',
                    style: kSummaryConditionStyle,
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }
}