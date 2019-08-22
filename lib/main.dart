import 'package:bmi/core/services/di.dart';
import 'package:bmi/ui/views/routes.dart';
import 'package:flutter/material.dart';

void main(){
  setupLocator();
  runApp(new MaterialApp(
    theme: ThemeData.dark(),
    onGenerateRoute: Router.generateRoute,
    initialRoute: Router.HOME_PAGE,
  ));
}