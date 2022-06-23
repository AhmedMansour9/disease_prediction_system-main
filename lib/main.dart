
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Modules/aboutUs.dart';
import 'package:graduation_project/Modules/register/register_screen.dart';
import 'package:graduation_project/Modules/result.dart';
import 'package:graduation_project/Shared/network/remote/dio_helper.dart';

import 'Layout/home.dart';
import 'Modules/login/Login.dart';
import 'Modules/Register.dart';
import 'Modules/symptomsList.dart';
import 'Modules/userAcc/userAcc.dart';
import 'Shared/bloc_observer.dart';


main () {
  BlocOverrides.runZoned(
        () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  DioHelper.initPaythonServer();
  runApp(graduationProject());
}

class graduationProject extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: homeLayOut(),

    );
  }
}
