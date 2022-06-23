
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'login/Login.dart';
import 'package:graduation_project/Layout/home.dart';

class registerScreen extends StatefulWidget {

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  var nameController = TextEditingController();

  var genderController = TextEditingController();

  var ageController = TextEditingController();

  var mailController = TextEditingController();

  var addressController = TextEditingController();

  var phoneController = TextEditingController();

  var passController = TextEditingController();

  var formPatientkey= GlobalKey<FormState>();

  bool isPass=true;

  Database database;

  @override
  void initState() {
    super.initState();
    CreateDB();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.app_registration
        ),
        title: Text(
          'Register',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: formPatientkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if(value.isEmpty)
                      {
                        return 'Name must not be empty';
                      }
                      return null;
                    },
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {},
                    decoration: InputDecoration(
                      labelText: '  Name: ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    validator: (value) {
                      if(value.isEmpty)
                      {
                        return 'gender must not be empty';
                      }
                      return null;
                    },
                    controller: genderController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {},
                    decoration: InputDecoration(
                      labelText: '  Gender: ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    validator: (value) {
                      if(value.isEmpty)
                      {
                        return 'Age must not be empty';
                      }
                      return null;
                    },
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (String value) {},
                    decoration: InputDecoration(
                      labelText: '  Age:',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    validator: (value) {
                      if(value.isEmpty)
                      {
                        return 'address must not be empty';
                      }
                      return null;
                    },
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {},
                    decoration: InputDecoration(
                      labelText: '  Address:',
                      prefixIcon: Icon(
                        Icons.home_outlined,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    validator: (value) {
                      if(value.isEmpty)
                      {
                        return 'Phone must not be empty';
                      }
                      return null;
                    },
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (String value) {},
                    decoration: InputDecoration(
                      labelText: 'Contact No:',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    validator: (value) {
                      if(value.isEmpty)
                      {
                        return 'Email must not be empty';
                      }
                      return null;
                    },
                    controller: mailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {},
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
              validator: (value) {
                if(value.isEmpty)
                {
                  return 'pass must not be empty';
                }
                return null;
              },
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isPass,
              onFieldSubmitted: (String value) {
                print(value);
              },
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                ),
                suffixIcon: IconButton(onPressed:() {
                  setState(() {

                  });
                  isPass = !isPass;
                } ,
                  icon: Icon(
                      Icons.remove_red_eye
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
                  SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () {
                        if(formPatientkey.currentState.validate()) {
                          insertToDatabase(
                            name: nameController.text,
                            gender: genderController.text,
                            address: addressController.text,
                            age: int.parse(ageController.text),
                            email: mailController.text,
                            pass: passController.text,
                            phone: phoneController.text
                          ).then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>LoginScreen())
                          ));
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void CreateDB() async {
    database = await openDatabase('User.db', version: 1,
        onCreate: (Database database, int version) {
          // When creating the db, create the table
          print('Data base created');
          database.execute(
              'CREATE TABLE patient (id INTEGER PRIMARY KEY, name TEXT, gender TEXT, age INTEGER,address TEXT,phone TEXT, email TEXT, Pass TEXT)'
          ).then((value) {
            print('table created');
          }
          ).catchError((Error) {
            print('Error when creating table ${Error.toString()}');
          });
        },
        onOpen: (database) {
          print('database opened');
        }
    );
  }

  Future insertToDatabase({@required String name, @required String gender,
      @required int age, @required String address, @required String phone,
      @required String email, @required String pass})async {
    return await database.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO patient(name, gender, age, address, phone, email, Pass) VALUES("${name}", "${gender}",$age,"${address}","${phone}","${email}","${pass}")')
          .then((value) {
        print('$value inserted Successfully');
      })
          .catchError((onError) {
        print('Error when Inserting new record${onError.toString()}');
      });
      return null;
    });
  }

}
