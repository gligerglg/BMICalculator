import 'package:bmi/ui/views/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home.dart';



class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case Router.HOME_PAGE:
        return MaterialPageRoute(builder: (_)=>Home());
      case Router.RESULT_PAGE:
        return MaterialPageRoute(builder: (_)=>Result());
      default:
        return MaterialPageRoute(builder: (_)=>Scaffold(
          body: Center(
            child: Text("Invalid Route"),
          ),
        ));
    }
  }

  static const String HOME_PAGE = "home";
  static const String RESULT_PAGE = "result";
}