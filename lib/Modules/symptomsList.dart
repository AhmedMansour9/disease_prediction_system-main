import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Models/symptoms_model.dart';
import 'package:graduation_project/Modules/result.dart';
import 'package:graduation_project/Shared/components/components.dart';
import 'package:graduation_project/Shared/components/constants.dart';

import 'login/cubit/cubit.dart';
import 'login/cubit/states.dart';

class symptomsScreen extends StatefulWidget {

  @override
  State<symptomsScreen> createState() => _symptomsScreenState();
}

class _symptomsScreenState extends State<symptomsScreen> {
  var SearchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            appBar:AppBar(
              title: Text(
                'Symptoms List',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            body:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  defaultFormField(
                    controller: SearchController,
                    type: TextInputType.text,
                    label: 'search symptoms',
                    prefix: Icons.search,
                  ),
                  SizedBox(height: 15,),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => symptomsItem(symptomsList[index],index),
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 20.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 1.0,
                            color: Colors.grey[300],
                          ),
                        ),
                        itemCount: symptomsList.length
                    ),
                  ),
                  SizedBox(height: 15,),
                  defaultButton(
                    function: (){
                      // navigateTo(context, resultScreen());
                      Map<String, dynamic> data = toJson();
                      LoginCubit.get(context).sendDataPaython(
                          data: data );


                    },
                    text: 'See Your Result',
                    isUpperCase: true,
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    symptomsList.forEach((element) {
      map[element.name] = element.check;
    });
    return map;
  }
  Widget symptomsItem(SymptomsModel symptoms,int index) =>  Row(
    children: [
      Checkbox(
          value: symptoms.check  == 0 ? false : true,
          onChanged: (value){
            setState(() {
              if( value){
                symptomsList[index].check = 1;
              }else {
                symptomsList[index].check = 0;
              }
              // symptoms.check=!symptoms.check;
              symptomsList.forEach((element) {
                print("lissssst"+element.name +" "+ element.check.toString());
              });
            });
          }
      ),
      SizedBox(width: 20,),
      Text(
        '${symptoms.name}',
        style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),

    ],
  );
}
