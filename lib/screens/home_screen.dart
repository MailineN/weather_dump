import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:weather_dump/components/card_skeleton.dart';
import 'package:weather_dump/components/constants.dart';
import 'package:weather_dump/components/location.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:weather_dump/components/source.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double temp = 23.3;
  int cond = 3;
  String place = 'Bruz';

  double lat; 
  double long; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF1FB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DisplayedHead(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Feather.map_pin,
                  color: kHeaderColor,
                  size: 20.0,
                ),
              ),
              Text(place.toString(),
                  style: TextStyle(
                      color: Color(0xFF252726),
                      fontFamily: 'Open',
                      fontSize: 15.0)),
            ],
          ),
          ComponentCard(
            colour: Colors.white,
            cardChild: Column(
              children: <Widget>[
                //TODO : Add Weather information
                Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          WeatherIcons.wi_stars,
                          color: kHeaderColor,
                          size: 40.0,
                        )),
                    Text(
                      'GLOBAL POLLEN SUMMARY',
                      style: kSummaryNumberStyle,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          WeatherIcons.wi_day_cloudy,
                          color: kHeaderColor,
                          size: 35.0,
                        )),
                    SizedBox(width: 15.0),
                    Text(
                      'GLOBAL WEATHER SUMMARY',
                      style: kSummaryNumberStyle,
                    ),
                  ],
                ),
                SizedBox(height: 10.0)
              ],
            ),
          ),
        ],
      ),
    );
  }
}