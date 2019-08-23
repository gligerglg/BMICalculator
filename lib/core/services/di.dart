import 'package:bmi/core/viewmodels/home_model.dart';
import 'package:bmi/core/viewmodels/result_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator(){
  locator.registerLazySingleton(()=>HomeModel());
  locator.registerFactory(()=>ResultModel());
}