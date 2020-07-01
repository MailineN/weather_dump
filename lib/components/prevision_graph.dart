import 'package:flutter/material.dart';
import 'constants.dart';

class Graph extends StatelessWidget {
  final List<Map> futureWeather;
  final AnimationController animationController;
  Graph({this.futureWeather, this.animationController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
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
              SizedBox(height: 5.0),
              Icon(
                futureWeather[0]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
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
              SizedBox(height: 5.0),
              Icon(
                futureWeather[1]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
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
              SizedBox(height: 5.0),
              Icon(
                futureWeather[2]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
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
              SizedBox(height: 5.0),
              Icon(
                futureWeather[3]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
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
              SizedBox(height: 5.0),
              Icon(
                futureWeather[4]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
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
              SizedBox(height: 5.0),
              Icon(
                futureWeather[5]['icon'],
                color: kHeaderColor,
                size: 15.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
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
              SizedBox(height: 5.0),
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
    return CustomPaint(
      painter: BarPainter(max: widget.max, min: widget.min),
      child: Column(
        children: <Widget>[
          Container(
            height: 200.0,
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
    Offset bottomPoint = Offset(0, 200.0);
    Offset centralPoint = Offset(0, 150.0);
    canvas.drawLine(topPoint, bottomPoint, grey);

    Paint filled = Paint()
      ..shader = LinearGradient(
        colors: [kBarTopColor, kBarBottomColor],
      ).createShader(Rect.fromPoints(topPoint, bottomPoint))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7.0;

    Offset filledTopBarHeight = Offset(0, ((max * 100.0) / 40.0));
    Offset filledBotBarHeight = Offset(0, ((min * 100.0) / 40.0));
    canvas.drawLine(centralPoint, filledTopBarHeight, filled);
    canvas.drawLine(filledBotBarHeight, centralPoint, filled);
  }

  @override
  bool shouldRepaint(CustomPainter old) {}
}

class ShowGraph extends StatefulWidget {
  final List<Map> futureWeather;
  ShowGraph({this.futureWeather});

  @override
  _ShowGraphState createState() => _ShowGraphState();
}

class _ShowGraphState extends State<ShowGraph>
    with SingleTickerProviderStateMixin {
  AnimationController _graphAnimationController;
  @override
  void initState() {
    super.initState();
    _graphAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  void dispose() {
    _graphAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      alignment: Alignment.center,
      child: InkWell(
          onTap: () {
            _graphAnimationController.forward();
          },
          child: Graph(
              animationController: _graphAnimationController,
              futureWeather: widget.futureWeather)),
    );
  }
}
