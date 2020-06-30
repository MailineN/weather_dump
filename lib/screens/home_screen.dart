import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:weather_dump/components/card_skeleton.dart';
import 'package:weather_dump/components/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:weather_dump/components/weather_icon.dart';

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
  int min; 
  int max;
  WeatherClass weather = WeatherClass();
  @override
  void initState() {
    super.initState();
    updateWeatherInfo(widget.locationWeather);
  }

  void updateWeatherInfo(dynamic weatherResult) {
    setState(() {
      temp = weatherResult['main']['temp'];
      cond = weatherResult['weather'][0]['description'];
      var iconCode = weatherResult['weather'][0]['id'];
      place = weatherResult['name'];
      min = weatherResult['main']['temp_min'].round();
      max = weatherResult['main']['temp_max'].round();
      weaIcon = weather.getIcon(iconCode);
    });

    print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF1FB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: kSummaryConditionStyle,
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
                              '($min - $max °C today)',
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
          ),
        ],
      ),
    );
  }
}
