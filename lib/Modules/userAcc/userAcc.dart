
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Modules/aboutUs.dart';
import 'package:graduation_project/Modules/login/Login.dart';
import 'package:graduation_project/Shared/components/components.dart';

import '../symptomsList.dart';

class userProfile extends StatelessWidget {

  String email;
  String name;
  String phone;

  userProfile({
    @required this.email,
    @required this.name,
    @required this.phone,
   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           title: Text(
             'My Details'
           ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
        children: [
        Stack(
        alignment: AlignmentDirectional.bottomEnd,
          children: [
              CircleAvatar(
                foregroundColor: Colors.blue,
                radius: 30.0,
                backgroundImage: AssetImage('assets/images/me.png')
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohamed Hassan',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${email}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
          ),
        ),
        ],
      ),
            ),
            SizedBox(height: 20,),
            Card(
              color: Colors.blue,
              child: ListTile(
                title: Text(
                  'My details',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17


                  ),
                ),
                leading:Icon(Icons.assignment_ind),
                onTap: (){},



              ),
            ),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                title: Text(
                  'Search Disease',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                ),
                leading:Icon(Icons.search),
                onTap: (){
                    navigateTo(context,
                        symptomsScreen()
                    );

                },



              ),
            ),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                title: Text(
                  'Search Doctor',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                ),
                leading:Icon(Icons.search),
                onTap: (){},



              ),
            ),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                title: Text(
                  'My History',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                ),
                leading:Icon(Icons.feedback),
                onTap: (){},



              ),
            ),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                title: Text(
                  'About Us',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                ),
                leading:Icon(Icons.info_outline),
                onTap: (){
                  navigateTo(
                      context,
                      aboutUsScreen());
                },



              ),
            ),
            Card(
              color: Colors.blueGrey,
              child: ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                ),
                leading:Icon(Icons.logout),
                onTap: (){
                  navigateAndFinish(context,
                      LoginScreen()
                  );
                },



              ),
            ),
          ],


        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
