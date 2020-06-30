import 'package:http/http.dart';
import 'dart:convert';

class WeatherData {
  WeatherData({this.url});
  final String url;

  Future getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      var dataDecoder = jsonDecode(data);
      return(dataDecoder);
    } else {
      print(response.statusCode);
    }
  }
}
