import 'package:flutter/material.dart';
import 'constants.dart';

class Graph extends StatelessWidget {
  final AnimationController animationController;
  Graph({this.animationController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Bar(max:30),
          Bar(max:10),
          Bar(max:26),
          Bar(max:26),
          Bar(max:26),
          Bar(max:26),
          Bar(max:26),
        ],
      ),
    );
  }
}

class Bar extends StatefulWidget {
  final int max;
  Bar({this.max = 20});
  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BarPainter(max : widget.max),
      child: Container(
        height: 200.0,
      ),
    );
  }
}

class BarPainter extends CustomPainter{
  int max; 
  BarPainter({this.max});
  @override 
  void paint(Canvas canvas, Size size){
    Paint grey = Paint()
      ..color = Color(0xFFF7F7FF)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7.0;

    Offset topPoint = Offset(0, 0);
    Offset bottomPoint = Offset(0, 200.0);
    canvas.drawLine(topPoint, bottomPoint, grey);

    Paint filled = Paint()
      ..shader= LinearGradient(
        colors: [kBarTopColor,kBarBottomColor],).createShader(Rect.fromPoints(topPoint, bottomPoint)) 
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7.0;

    Offset filledBarHeight = Offset(0,(max*200.0)/40.0);
    canvas.drawLine(bottomPoint, filledBarHeight, filled);
  }
  @override 
  bool shouldRepaint(CustomPainter old) {

  }
}

class ShowGraph extends StatefulWidget {
  ShowGraph({Key key}) : super(key: key);

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
          )),
    );
  }
}
