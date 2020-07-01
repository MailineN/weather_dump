import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_dump/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:weather_dump/components/location.dart';
import 'package:weather_dump/components/source.dart';
import 'home_screen.dart';
const kApi_key = '91e2dc7636f95acddb41f5b7e93b8b8d' ;
const kApiP_key= '579987540270436987fac9a794a6b99b';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  double lat; 
  double long; 
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

    void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    long = location.longitude;
    WeatherData weatherData = WeatherData(url : 'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&exclude=minutely,hourly&appid=$kApi_key&units=metric');
      var weatherResult = await weatherData.getData();
    PollenData pollenData = PollenData(url: 'https://api.breezometer.com/pollen/v2/forecast/daily?&lat=$lat&lon=$long&features=types_information&key=$kApiP_key&days=1');
      var pollenResult = await pollenData.getData();
      print('Pollen data : $pollenResult');
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return HomePage(locationWeather: weatherResult,locationPollen: pollenResult,);
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHeaderColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Fetching Your Location', 
            style: kLoadingStyle, ),
            SizedBox(height : 40.0),
            SpinKitChasingDots(
              color: Colors.white,
              size: 70.0,
            ),
          ],
        ),
        ),
    );
  }
}

