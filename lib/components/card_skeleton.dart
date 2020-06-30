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
