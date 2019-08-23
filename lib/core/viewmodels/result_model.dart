

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ResultModel with ChangeNotifier{
  Color _statusColor;

  Color get statusColor => _statusColor;

  set statusColor(Color value) {
    _statusColor = value;
  }

  Color mapStatusToColor(){

  }

}