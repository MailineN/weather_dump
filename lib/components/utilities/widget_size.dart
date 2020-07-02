import 'package:flutter/cupertino.dart';

class WidgetSize {
  WidgetSize({this.height,this.width}); 
  double height; 
  double width; 
  double CalcHeight({double initialSize}){
    return((2340*initialSize)/height);
  }
    double CalcWidth({double initialSize}){
    return((1080*initialSize)/width);
  }
  double CalcSize({double initialSize}){
    return((height*height/(2340*1080))*initialSize);
  }
}