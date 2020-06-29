import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_dump/components/card_skeleton.dart';
import 'package:weather_dump/components/constants.dart';
import 'package:weather_dump/components/location.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Response response = await get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    if (response.statusCode == 200) {
      String data = response.body;
    } else {
      print(response.statusCode);
    }
  }

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
                  color: Color(0xFF3842C8),
                  size: 20.0,
                ),
              ),
              Text('Your location',
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
                          color: Color(0xFF3842C8),
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
                          color: Color(0xFF3842C8),
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
