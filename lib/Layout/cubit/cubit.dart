
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/cubit/states.dart';

class projectCuibt extends Cubit<projectStates>{

  projectCuibt() : super(projectIntialState());

  static projectCuibt get(context) => BlocProvider.of(context);

}

