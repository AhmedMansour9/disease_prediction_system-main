
import 'package:flutter/material.dart';
import 'package:graduation_project/Modules/login/Login.dart';
import 'package:sqflite/sqflite.dart';




class homeLayOut extends StatefulWidget {

  @override
  State<homeLayOut> createState() => _homeLayOutState();
}

class _homeLayOutState extends State<homeLayOut> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20,),
            Image(
              image: AssetImage('assets/images/helwanLogo.png'),

            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue
                ),
                clipBehavior: Clip.antiAlias,
                child: Image(

                  image: AssetImage('assets/images/homelogo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'WELCOME ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25,

              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                width: 200,
                height: 50,
                child: MaterialButton(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()
                        )
                    );
                  },


                )
            ),

          ],
        ),
      ),
    );
  }



}

