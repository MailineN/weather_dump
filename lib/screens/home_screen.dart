import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:weather_dump/components/card_skeleton.dart';
import 'package:weather_dump/components/constants.dart';
import 'package:weather_dump/components/location.dart';
import 'package:flutter_icons/flutter_icons.dart';


class HomePage extends StatefulWidget {
  HomePage({this.locationWeather}); 
  final locationWeather; 

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double temp = 20;
  int cond = 400;
  String place;
  @override
  void initState(){
    super.initState();
    updateWeatherInfo(widget.locationWeather);
  }
  
  void updateWeatherInfo(dynamic weatherResult){
    double temp = weatherResult['main']['temp'];
    int cond = weatherResult['weather'][0]['id'];
    String place = weatherResult['name'];

  }
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
                    Text(temp.toString(),
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