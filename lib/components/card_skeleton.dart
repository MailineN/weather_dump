import 'package:flutter/material.dart';
import 'constants.dart';

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
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.0),bottomRight: Radius.circular(25.0)), 
        color: Color(0xFF3842C8),
        ),
    );
  }
}

class DisplayedHead extends StatelessWidget {
  DisplayedHead();
  @override
  Widget build(BuildContext context) {
    return HeadCard(
      //TODO : Add complex form (REDO the shape of it)
      cardChild: Column(
        children: <Widget>[
          SizedBox(height: 25.0),
          Container(
              margin: EdgeInsets.all(10.0),
              child: Text(
                'Pollen & Weather forecast',
                style: kTitleNumberStyle,
                textAlign: TextAlign.center,
              )),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10.0),
            child: Text(
              'Hello _Name',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Open',
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}