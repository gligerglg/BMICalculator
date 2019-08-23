import 'package:bmi/core/models/result_data.dart';
import 'package:bmi/core/services/di.dart';
import 'package:bmi/core/viewmodels/home_model.dart';
import 'package:bmi/core/viewmodels/result_model.dart';
import 'package:bmi/ui/shared/common_ui.dart';
import 'package:bmi/ui/shared/colors.dart';
import 'package:bmi/ui/views/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => locator<HomeModel>(),
      child: Consumer<HomeModel>(
          builder: (context, model, child) => Scaffold(
            backgroundColor: AppColors.background_dark,
                appBar: buildAppBar(),
                body: SafeArea(
                    child: Column(
                  children: <Widget>[

                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: model.gender==Gender.MALE?AppColors.button_inactive:AppColors.card_background,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Icon(Icons.accessibility_new,size: 60,color: model.gender==Gender.MALE?Colors.white:AppColors.text_color,),
                                        SizedBox(height: 10,),
                                        Text("MALE",style: TextStyle(fontSize: 20,color: model.gender==Gender.MALE?Colors.white:AppColors.text_color),)
                                      ],
                                    ),
                                  ),

                                  onTap: (){
                                    model.gender = Gender.MALE;
                                  },
                                ),
                              ),

                              SizedBox(width: 20,),

                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: model.gender==Gender.FEMALE?AppColors.button_inactive:AppColors.card_background,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Icon(Icons.accessible_forward,size: 60,color: model.gender==Gender.FEMALE?Colors.white:AppColors.text_color,),
                                        SizedBox(height: 10,),
                                        Text("FEMALE",style: TextStyle(fontSize: 20,color: model.gender==Gender.FEMALE?Colors.white:AppColors.text_color),)
                                      ],
                                    ),
                                  ),

                                  onTap: (){
                                    model.gender = Gender.FEMALE;
                                  },
                                ),
                              )
                            ],
                          ),

                          SizedBox(height: 20,),

                          buildHeightModule(model, context),

                          SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildWeightModule(model),
                              SizedBox(width: 20,),
                              buildAgeModule(model)
                            ],
                          ),

                        ],
                      ),
                    )),
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
                          child: Text("CALCULATE YOUR BMI",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      onTap: (){
                        var resultData = model.bmiResult();
                        Navigator.pushNamed(context, Router.RESULT_PAGE,arguments: resultData);
                      },
                    )
                  ],
                )),
              )),
    );
  }







}
