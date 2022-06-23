
import 'package:flutter/material.dart';
import 'package:graduation_project/Modules/disease_Information.dart';
import 'package:graduation_project/Modules/userAcc/userAcc.dart';
import 'package:graduation_project/Shared/components/components.dart';

class resultScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.medical_services_outlined),
        title: Text(
          'Your Result',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),

        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue
                ),
                clipBehavior: Clip.antiAlias,
                child: Image(
                  image: AssetImage('assets/images/result.jpg'),

                ),
              ),

              SizedBox(height: 60,),
               Text(
                   'Your Result is..',
                 style: TextStyle(
                   fontSize: 20
                 ),
               ),
              Text(
                'Common Cold',

                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
              SizedBox(height: 60,),
              defaultButton(
                  function: (){
                    navigateTo(context, diseaseInformation());
                  },
                  text: 'Disease Information'
              ),
              SizedBox(height: 20,),
              defaultButton(
                  function: (){},
                  text: 'find Doctors nearby'
              ),


            ],
          ),
        ),
      ),
    );
  }
}
