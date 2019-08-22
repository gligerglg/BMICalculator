import 'package:bmi/core/services/di.dart';
import 'package:bmi/core/viewmodels/home_model.dart';
import 'package:bmi/ui/shared/colors.dart';
import 'package:flutter/material.dart';
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
                appBar: AppBar(
                  backgroundColor: AppColors.background_dark,
                  title: Text("BMI CALCULATOR"),
                  centerTitle: true,
                  elevation: 20,
                ),
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
                                child: Container(
                                  height: 170,
                                  color: AppColors.card_background,
                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Container(
                                  height: 170,
                                  color: AppColors.card_background,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                    Container(
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
                    )
                  ],
                )),
              )),
    );
  }
}
