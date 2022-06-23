

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Modules/login/Login.dart';
import 'package:graduation_project/Modules/register/cubit/cubit.dart';
import 'package:graduation_project/Modules/register/cubit/states.dart';
import 'package:graduation_project/Shared/components/components.dart';
import 'package:intl/intl.dart';

class RegisterScreenAPI extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var genderController = TextEditingController();
  var ageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.loginModel.status) {
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              showToast(
                  text: state.loginModel.message,
                  state: ToastStates.SUCCESS);
              navigateTo(context, LoginScreen());

            } else {
              print(state.loginModel.message);
              showToast(
                  text: state.loginModel.message,
                  state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your name';
                            }
                          },
                          label: 'User Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: RegisterCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formKey.currentState.validate()) {
                              RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text
                              );
                            }
                          },
                          isPassword: RegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height:15.0,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your phone number';
                            }
                          },
                          label: 'phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(value: RegisterCubit.get(context).checkGender, onChanged: (value) {

                              RegisterCubit.get(context).toggleCheckBoxGender();

                              },),
                            SizedBox(width: 10,),
                            Text(
                              'Male',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            ),
                            SizedBox(width: 50,),
                            Checkbox(value: !RegisterCubit.get(context).checkGender, onChanged: (value) {
                               RegisterCubit.get(context).toggleCheckBoxGender();

                            },),
                            SizedBox(width: 10,),
                            Text(
                              'Female',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            ),


                          ],
                        ),

                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: ageController,
                          type: TextInputType.number,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your date of birth';
                            }
                          },
                          onTap: (){
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.parse('1900-01-01'),
                                lastDate: DateTime.now()
                            ).then((value) {
                              ageController.text=DateFormat.yMMMd().format(value);
                            });

                          },
                          label: 'Your date of birth',
                          prefix: Icons.calendar_today,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(value: RegisterCubit.get(context).check1, onChanged: (value) {
                              RegisterCubit.get(context).toggleCheckBox1();
                            },),
                            SizedBox(width: 10,),
                            Text(
                                'Do You have blood pressure?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                              ),
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(value: RegisterCubit.get(context).check2, onChanged: (value) {
                              RegisterCubit.get(context).toggleCheckBox2();
                            },),
                            SizedBox(width: 10,),
                            Text(
                              'Do You have diabetes?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(value: RegisterCubit.get(context).check3, onChanged: (value) {
                              RegisterCubit.get(context).toggleCheckBox3();
                            },),
                            SizedBox(width: 10,),
                            Text(
                                'Do You have heart disease?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState.validate()) {
                                print('hello');
                                RegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text
                                );

                              }
                            },
                            text: 'Register',
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );


        },
      ),

    );
  }
}
