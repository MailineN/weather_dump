import 'package:flutter/material.dart';
import 'package:weather_dump/components/card_skeleton.dart';
import 'package:weather_dump/components/constants.dart';
import 'package:weather_dump/components/date.dart';
import 'package:weather_dump/components/weather_icon.dart';
import 'package:weather_dump/components/prevision_graph.dart';
import 'package:weather_dump/components/utilities/widget_size.dart';

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
  List<Map> pollenPrevision;
  List<Map> futureWeather;
  WeatherClass weather = WeatherClass();
  DateList date = DateList();
  List<dynamic> dateListe;
  String graphType = 'Weather';
  @override
  void initState() {
    super.initState();
    updateDate(date);
    updateWeatherInfo(widget.locationWeather);
    updatePollenInfo(widget.locationPollen);
  }

  void updateDate(dynamic date) {
    setState(() {
      var today = DateTime.now();
      dateListe = date.getDateList(today);
    });
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
          'icon':
              weather.getIcon(weatherResult['daily'][0]['weather'][0]['id']),
        },
        {
          'min': weatherResult['daily'][1]['temp']['min'].round(),
          'max': weatherResult['daily'][1]['temp']['max'].round(),
          'icon':
              weather.getIcon(weatherResult['daily'][1]['weather'][0]['id']),
        },
        {
          'min': weatherResult['daily'][2]['temp']['min'].round(),
          'max': weatherResult['daily'][2]['temp']['max'].round(),
          'icon':
              weather.getIcon(weatherResult['daily'][2]['weather'][0]['id']),
        },
        {
          'min': weatherResult['daily'][3]['temp']['min'].round(),
          'max': weatherResult['daily'][3]['temp']['max'].round(),
          'icon':
              weather.getIcon(weatherResult['daily'][3]['weather'][0]['id']),
        },
        {
          'min': weatherResult['daily'][4]['temp']['min'].round(),
          'max': weatherResult['daily'][4]['temp']['max'].round(),
          'icon':
              weather.getIcon(weatherResult['daily'][4]['weather'][0]['id']),
        },
        {
          'min': weatherResult['daily'][5]['temp']['min'].round(),
          'max': weatherResult['daily'][5]['temp']['max'].round(),
          'icon':
              weather.getIcon(weatherResult['daily'][5]['weather'][0]['id']),
        },
        {
          'min': weatherResult['daily'][6]['temp']['min'].round(),
          'max': weatherResult['daily'][6]['temp']['max'].round(),
          'icon':
              weather.getIcon(weatherResult['daily'][6]['weather'][0]['id']),
        },
      ];
    });
  }

  void updatePollenInfo(dynamic pollenResult) {
    setState(() {
      pollenPrevision = [
      {'alertLevel' : pollenResult['data'][0]['types']['grass']['index']['value']??0,
        'plantType' : pollenResult['data'][0]['types']['grass']['display_name'],
        'alertType' : pollenResult['data'][0]['types']['grass']['index']['category']??'Not in season',
      },
      {'alertLevel' : pollenResult['data'][0]['types']['tree']['index']['value']??0,
        'plantType' : pollenResult['data'][0]['types']['tree']['display_name'],
        'alertType' : pollenResult['data'][0]['types']['tree']['index']['category']??'Not in season',
      },
      {'alertLevel' : pollenResult['data'][0]['types']['weed']['index']['value']??0,
        'plantType' : pollenResult['data'][0]['types']['weed']['display_name'],
        'alertType' : pollenResult['data'][0]['types']['weed']['index']['category']??'Not in season',
      }
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
              alertType: pollenPrevision[0]['alertType'],
              plantType: pollenPrevision[0]['plantType'],
              alertLevel: pollenPrevision[0]['alertLevel']),
          ComponentCard(
            colour: Colors.white,
            cardChild: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width:SizeConfig.blockSizeHorizontal*2),
                    ButtonTheme(
                      height: SizeConfig.blockSizeVertical*3.7,
                      child: FlatButton(
                        onPressed: () {
                          if (graphType != 'Weather') {
                            setState(() {
                              graphType = 'Weather';
                            });
                          }
                        },
                        child: Text('Weather',style: kButtonStyle,),
                        color: Color(0xFFEAF1FB),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                    SizedBox(width:SizeConfig.blockSizeHorizontal*2),
                    ButtonTheme(
                      height: SizeConfig.blockSizeVertical*3.7,
                      child: FlatButton(
                        onPressed: () {
                          if (graphType != 'Pollen') {
                            setState(() {
                              graphType = 'Pollen';
                            });
                          }
                        },
                        child: Text('Pollen',style: kButtonStyle,),
                        color: Color(0xFFEAF1FB),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                ShowGraph(
                  futureWeather: futureWeather,
                  pollenResult: pollenPrevision,
                  daylist: dateListe,
                  graphDataType: graphType,
                ),
                SizedBox(height: 10.0)
              ],
            ),
          )
        ],
      ),
    );
  }
}
