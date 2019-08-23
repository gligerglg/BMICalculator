
import 'dart:math';

import 'package:bmi/core/models/result_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Gender{MALE,FEMALE}

class HomeModel with ChangeNotifier{
  Gender _gender;
  int _height;
  int _weight;
  int _age;

  int get age => _age;
  Gender get gender => _gender;
  int get weight => _weight;
  int get height => _height;


  HomeModel(){
    initValues();
  }

  void initValues(){
    _gender = Gender.MALE;
    _height = 120;
    _weight = 50;
    _age = 18;

    notifyListeners();
  }

  set age(int value) {
    _age = value;
    notifyListeners();
  }

  set weight(int value) {
    _weight = value;
    notifyListeners();
  }

  set height(int value) {
    _height = value;
    notifyListeners();
  }

  set gender(Gender value) {
    _gender = value;
    notifyListeners();
  }

  void increaseWeight(){
    _weight++;
    notifyListeners();
  }

  void decreaseWeight(){
    if(_weight!=0) {
      _weight--;
      notifyListeners();
    }
  }

  void increaseAge(){
    if(_age<=120){
      _age++;
      notifyListeners();
    }
  }

  void decreaseAge(){
    if(_age!=0){
      _age--;
      notifyListeners();
    }
  }

  ResultData bmiResult(){
    var result = ResultData();
    result.bmi = weight*(pow(100,2))/(pow(_height,2));

    if(result.bmi<=18.5){
      result.status = "Underweight";
      result.statusColor = Colors.blueAccent;
      result.message = "Common eat something!!!!";
    }else if(result.bmi<=24.9){
      result.status = "Normal";
      result.statusColor = Colors.lightGreen;
      result.message = "You have a normal body\nGood Job!";
    }else if(result.bmi<=29.9){
      result.status = "Overweight";
      result.statusColor = Colors.deepOrangeAccent;
      result.message = "Control your foods!";
    }else{
      result.status = "Obese";
      result.statusColor = Colors.red;
      result.message = "Go away!\n You are useless.";
    }

    return result;
  }
}