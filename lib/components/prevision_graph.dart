import 'package:flutter/material.dart';
import 'package:weather_dump/components/pollen_graph.dart';
import 'package:weather_dump/components/utilities/widget_size.dart';
import 'graph_weather.dart';


class ShowGraph extends StatefulWidget {
  final List<Map> futureWeather;
  final List<Map> pollenResult;
  final List<dynamic> daylist;
  final String graphDataType;
  ShowGraph({this.futureWeather, this.daylist, this.graphDataType,this.pollenResult});

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

  Widget selectGraph() {
    if (widget.graphDataType == 'Weather') {
      return Graph(
          animationController: _graphAnimationController,
          futureWeather: widget.futureWeather,
          daylist: widget.daylist);
    } else {
      return Container(
        child: PollenInfo(pollenResult: widget.pollenResult),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical*43,
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          _graphAnimationController.forward();
        },
        child: selectGraph(),
      ),
    );
  }
}
