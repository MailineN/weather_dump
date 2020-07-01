import 'package:flutter/material.dart';

class DateList {

  List getDateList(date){
    if (date.weekday==1) {
      return(['Mon','Tue','Wed','Thu','Fri','Sat','Sun']);
    } else if (date.weekday==2){
      return(['Tue','Wed','Thu','Fri','Sat','Sun','Mon']);
    } else if (date.weekday==3){
      return(['Wed','Thu','Fri','Sat','Sun','Mon','Tue']);
    } else if (date.weekday==4){
      return(['Thu','Fri','Sat','Sun','Mon','Tue','Wed']);
    } else if (date.weekday==5){
      return(['Fri','Sat','Sun','Mon','Tue','Wed','Thu']);
    } else if (date.weekday==6){
      return(['Sat','Sun','Mon','Tue','Wed','Thu','Fri']);
    } else {
      return(['Sun','Mon','Tue','Wed','Thu','Fri','Sat']);
    }
  }
}