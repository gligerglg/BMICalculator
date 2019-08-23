import 'package:bmi/core/viewmodels/home_model.dart';
import 'package:bmi/ui/shared/colors.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: AppColors.background_dark,
    title: Text("BMI CALCULATOR"),
    centerTitle: true,
    elevation: 20,
  );
}

Expanded buildGenderModule(HomeModel model,Gender type) {
  return Expanded(
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
            Icon(type==Gender.MALE?Icons.accessibility_new:Icons.accessible_forward,size: 60,color: model.gender==Gender.MALE?Colors.white:AppColors.text_color,),
            SizedBox(height: 10,),
            Text(type==Gender.MALE?"MALE":"FEMALE",style: TextStyle(fontSize: 20,color: model.gender==Gender.MALE?Colors.white:AppColors.text_color),)
          ],
        ),
      ),

      onTap: (){
        model.gender = Gender.MALE;
      },
    ),
  );
}

Expanded buildHeightModule(HomeModel model, BuildContext context) {
  return Expanded(
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.card_background,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("HEIGHT",style: TextStyle(fontSize: 15),),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(model.height.toString(),style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
              Text("cm")
            ],
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  trackHeight: 10,
                  thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15
                  )
              ),
              child: Slider(
                activeColor: AppColors.action_button_color,
                min: 0,
                max: 300,
                divisions: 600,
                value: model.height.toDouble(),
                onChanged: (double value){
                  model.height = value.toInt();
                },
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Expanded buildAgeModule(HomeModel model) {
  return Expanded(
    child: Container(
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.card_background,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("AGE",style: TextStyle(color: AppColors.text_color,fontSize: 15,fontWeight: FontWeight.bold),),
          Text(model.age.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),

          OutlineButton(
            child: Icon(Icons.add),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: ()=>model.increaseAge(),
          ),

          OutlineButton(
            child: Icon(Icons.remove),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: ()=>model.decreaseAge(),
          )
        ],
      ),
    ),
  );
}


Expanded buildWeightModule(HomeModel model) {
  return Expanded(
    child: Container(
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.card_background,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("WEIGHT",style: TextStyle(color: AppColors.text_color,fontSize: 15,fontWeight: FontWeight.bold),),
          Text(model.weight.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),

          OutlineButton(
            child: Icon(Icons.add),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: ()=>model.increaseWeight(),
          ),

          OutlineButton(
            child: Icon(Icons.remove),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: ()=>model.decreaseWeight(),
          )
        ],
      ),
    ),
  );
}