import 'package:geocoder/geocoder.dart';
import 'package:flutter/material.dart';
import 'package:weather_dump/components/card_skeleton.dart';
import 'package:weather_dump/components/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:weather_dump/components/weather_icon.dart';
import 'package:weather_dump/components/prevision_graph.dart';

class HomePage extends StatefulWidget {
  HomePage({this.locationWeather});
  final locationWeather;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double temp;
  String cond;
  String place;
  IconData weaIcon;
  int todayMin;
  int todayMax;
  WeatherClass weather = WeatherClass();
  @override
  void initState() {
    super.initState();
    updateWeatherInfo(widget.locationWeather);
  }

  void updateWeatherInfo(dynamic weatherResult) {
    setState(() {
      temp = weatherResult['current']['temp'].toDouble();
      cond = weatherResult['current']['weather'][0]['description'];
      var iconCode = weatherResult['current']['weather'][0]['id'];
      place = weatherResult['timezone'];
      todayMin = weatherResult['daily'][0]['temp']['min'].round();
      todayMax = weatherResult['daily'][0]['temp']['max'].round();
      weaIcon = weather.getIcon(iconCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF1FB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DisplayedHead(
            name: 'Mailine',
            location: place,
          ),
          SummaryCard(
              weaIcon: weaIcon,
              temp: temp,
              todayMin: todayMin,
              todayMax: todayMax,
              cond: cond),
          ComponentCard(
            colour: Colors.white,
            cardChild: Column(
              children: <Widget>[
                Text('Select Pollen or Weather Button', style : kSummaryConditionStyle),
                Text('Mon Tue Wed Thu Fri Sat Sun', style : kSummaryConditionStyle),
                ShowGraph(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
