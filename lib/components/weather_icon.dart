  
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

const kApi_key = '91e2dc7636f95acddb41f5b7e93b8b8d' ;
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherClass {

  IconData getIcon(int condition) {
    if (condition < 300) {
      return WeatherIcons.wi_day_thunderstorm;
    } else if (condition < 400) {
      return WeatherIcons.wi_day_rain_mix;
    } else if (condition < 600) {
      return WeatherIcons.wi_day_rain;
    } else if (condition < 700) {
      return WeatherIcons.wi_day_snow;
    } else if (condition < 800) {
      return WeatherIcons.wi_fog;
    } else if (condition == 800) {
      return WeatherIcons.wi_day_sunny;
    } else if (condition <= 804) {
      return WeatherIcons.wi_day_cloudy;
    } else {
      return WeatherIcons.wi_na;
    }
  }
}