import 'package:bmi/core/models/result_data.dart';
import 'package:bmi/core/services/di.dart';
import 'package:bmi/core/viewmodels/home_model.dart';
import 'package:bmi/core/viewmodels/result_model.dart';
import 'package:bmi/ui/shared/colors.dart';
import 'package:bmi/ui/shared/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Result extends StatefulWidget {
  final ResultData _data;

  Result(this._data);

  @override
  _ResultState createState() => _ResultState(_data);
}

class _ResultState extends State<Result> {

  final ResultData resultData;
  _ResultState(this.resultData);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context)=>locator<ResultModel>(),
      child: Consumer<ResultModel>(
        builder: (context,model,chile){
          return Scaffold(
              backgroundColor: AppColors.background_dark,
            appBar: buildAppBar(),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Your Result",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.card_background,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(resultData.status.toUpperCase(),style: TextStyle(
                              color: resultData.statusColor,
                              fontWeight: FontWeight.bold,
                            fontSize: 22
                          ),),

                          SizedBox(height: 30,),

                          Text(resultData.bmi.toStringAsFixed(1),style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold
                          ),),

                          SizedBox(height: 10,),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Normal BMI Range",style: TextStyle(color: AppColors.text_color,fontSize: 18),),
                              Text("18,5 - 25 kg/m2",style: TextStyle(fontSize: 18),)
                            ],
                          ),

                          SizedBox(height: 30,),

                          Text(resultData.message,style: TextStyle(fontSize: 18,), textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
                  ),

                  InkWell(
                    child: Container(
                      height: 55,
                      width:double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.action_button_color,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Center(
                        child: Text("RE-CALCULATE YOUR BMI",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
