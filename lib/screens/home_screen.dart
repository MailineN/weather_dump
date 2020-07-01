
import 'package:flutter/material.dart';
import 'package:weather_dump/components/card_skeleton.dart';
import 'package:weather_dump/components/constants.dart';
import 'package:weather_dump/components/weather_icon.dart';
import 'package:weather_dump/components/prevision_graph.dart';

class HomePage extends StatefulWidget {
  HomePage({this.locationWeather, this.locationPollen});
  final locationWeather;
  final locationPollen;

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
  int alertLevel; 
  String alertType = 'Everything seems fine'; 
  String plantType; 
  List<Map> futureWeather;
  WeatherClass weather = WeatherClass();
  @override
  void initState() {
    super.initState();
    updateWeatherInfo(widget.locationWeather);
    updatePollenInfo(widget.locationPollen);
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
      futureWeather = [
      {
      'min': weatherResult['daily'][0]['temp']['min'].round(),
      'max': weatherResult['daily'][0]['temp']['max'].round(), 
      'icon' : weather.getIcon(weatherResult['daily'][0]['weather'][0]['id']),
      },
      {
      'min': weatherResult['daily'][1]['temp']['min'].round(),
      'max': weatherResult['daily'][1]['temp']['max'].round(), 
      'icon' : weather.getIcon(weatherResult['daily'][1]['weather'][0]['id']),
      },
      {
      'min': weatherResult['daily'][2]['temp']['min'].round(),
      'max': weatherResult['daily'][2]['temp']['max'].round(), 
      'icon' : weather.getIcon(weatherResult['daily'][2]['weather'][0]['id']),
      },
      {
      'min': weatherResult['daily'][3]['temp']['min'].round(),
      'max': weatherResult['daily'][3]['temp']['max'].round(), 
      'icon' : weather.getIcon(weatherResult['daily'][3]['weather'][0]['id']),
      },
      {
      'min': weatherResult['daily'][4]['temp']['min'].round(),
      'max': weatherResult['daily'][4]['temp']['max'].round(), 
      'icon' : weather.getIcon(weatherResult['daily'][4]['weather'][0]['id']),
      },
      {
      'min': weatherResult['daily'][5]['temp']['min'].round(),
      'max': weatherResult['daily'][5]['temp']['max'].round(), 
      'icon' : weather.getIcon(weatherResult['daily'][5]['weather'][0]['id']),
      },
      {
      'min': weatherResult['daily'][6]['temp']['min'].round(),
      'max': weatherResult['daily'][6]['temp']['max'].round(), 
      'icon' : weather.getIcon(weatherResult['daily'][6]['weather'][0]['id']),
      },
      ];
    });
  }

  void updatePollenInfo(dynamic pollenResult) {
    alertLevel= pollenResult['data'][0]['types']['grass']['index']['value'];
    plantType= pollenResult['data'][0]['types']['grass']['display_name'];
    if (alertLevel >0){
        alertType= pollenResult['data'][0]['types']['grass']['index']['category'];
    }
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
              cond: cond,
              alertType : alertType, 
              plantType : plantType, 
              alertLevel : alertLevel),
          ComponentCard(
            colour: Colors.white,
            cardChild: Column(
              children: <Widget>[
                Text('Select Pollen or Weather Button', style : kSummaryConditionStyle),
                Text('Insert Future Days', style : kSummaryConditionStyle),
                SizedBox(height:15.0),
                ShowGraph(futureWeather: futureWeather),
              ],
            ),
          )
        ],
      ),
    );
  }
}
