
import 'package:flutter/cupertino.dart';

class ResultData{
  String _status;
  double _bmi;
  String _message;
  Color _statusColor;

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  double get bmi => _bmi;

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  set bmi(double value) {
    _bmi = value;
  }

  Color get statusColor => _statusColor;

  set statusColor(Color value) {
    _statusColor = value;
  }


}