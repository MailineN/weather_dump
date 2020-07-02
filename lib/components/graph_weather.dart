import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:weather_dump/components/utilities/widget_size.dart';

class Graph extends StatelessWidget {
  final List<Map> futureWeather;
  final List<dynamic> daylist;
  final AnimationController animationController;
  Graph({this.futureWeather, this.animationController, this.daylist});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(daylist[0], style: kBarDayStyle),
              Text(
                futureWeather[0]['max'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: 10.0),
              Bar(max: futureWeather[0]['max'], min: futureWeather[0]['min']),
              SizedBox(height: 10.0),
              Text(
                futureWeather[0]['min'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*1),
              Icon(
                futureWeather[0]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(daylist[1], style: kBarDayStyle),
              Text(
                futureWeather[1]['max'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: 10.0),
              Bar(max: futureWeather[1]['max'], min: futureWeather[1]['min']),
              SizedBox(height: 10.0),
              Text(
                futureWeather[1]['min'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*1),
              Icon(
                futureWeather[1]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(daylist[2], style: kBarDayStyle),
              Text(
                futureWeather[2]['max'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: 10.0),
              Bar(max: futureWeather[2]['max'], min: futureWeather[2]['min']),
              SizedBox(height: 10.0),
              Text(
                futureWeather[2]['min'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*1),
              Icon(
                futureWeather[2]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(daylist[3], style: kBarDayStyle),
              Text(
                futureWeather[3]['max'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: 10.0),
              Bar(max: futureWeather[3]['max'], min: futureWeather[3]['min']),
              SizedBox(height: 10.0),
              Text(
                futureWeather[3]['min'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*1),
              Icon(
                futureWeather[3]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(daylist[4], style: kBarDayStyle),
              Text(
                futureWeather[4]['max'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: 10.0),
              Bar(max: futureWeather[4]['max'], min: futureWeather[4]['min']),
              SizedBox(height: 10.0),
              Text(
                futureWeather[4]['min'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*1),
              Icon(
                futureWeather[4]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(daylist[5], style: kBarDayStyle),
              Text(
                futureWeather[5]['max'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: 10.0),
              Bar(max: futureWeather[5]['max'], min: futureWeather[5]['min']),
              SizedBox(height: 10.0),
              Text(
                futureWeather[5]['min'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*1),
              Icon(
                futureWeather[5]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(daylist[6], style: kBarDayStyle),
              Text(
                futureWeather[6]['max'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: 10.0),
              Bar(max: futureWeather[6]['max'], min: futureWeather[6]['min']),
              SizedBox(height: 10.0),
              Text(
                futureWeather[6]['min'].toString() + '°C',
                style: kSummaryConditionStyle,
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*1),
              Icon(
                futureWeather[6]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatefulWidget {
  final int max;
  final int min;
  Bar({this.max, this.min});
  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CustomPaint(
      painter: BarPainter(max: widget.max, min: widget.min),
      child: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.blockSizeVertical*27,
          ),
        ],
      ),
    );
  }
}

class BarPainter extends CustomPainter {
  int max;
  int min;
  BarPainter({this.max, this.min});
  @override
  void paint(Canvas canvas, Size size) {
    Paint grey = Paint()
      ..color = Color(0xFFF7F7FF)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7.0;

    Offset topPoint = Offset(0, 0);
    Offset bottomPoint = Offset(0, SizeConfig.blockSizeVertical*27);
    canvas.drawLine(topPoint, bottomPoint, grey);

    Paint filled = Paint()
      ..shader = LinearGradient(
        colors: [kBarTopColor, kBarBottomColor],
        begin: Alignment.topCenter
      ).createShader(Rect.fromPoints(topPoint, bottomPoint))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7.0;

    Offset filledTopBarHeight = Offset(0, (((25 - max) * SizeConfig.blockSizeVertical*27) / 25.0));
    Offset filledBottomBarHeight =
        Offset(0, (((25 - min) * SizeConfig.blockSizeVertical*27) / 25.0) + 60);
    canvas.drawLine(filledBottomBarHeight, filledTopBarHeight, filled);
  }

  @override
  bool shouldRepaint(CustomPainter old) {}
}