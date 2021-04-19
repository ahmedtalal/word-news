import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:worldnews/components/action_widget.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/models/user_model.dart';
import 'package:worldnews/pages/home.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_bloc.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_events.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email, password;
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool isProgress = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var firebaseProvider = BlocProvider.of<FirebaseBloc>(context);

    return Scaffold(
      key: scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: isProgress,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.07,
                ),
                ActionWidget(
                  onClick: () {
                    Navigator.of(context).pop(context);
                  },
                  icon: Icons.arrow_back_ios_rounded,
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Center(
                  child: Image(
                    image: AssetImage(
                      Constants.registerImage,
                    ),
                    height: height * 0.19,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.07,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                    size: 20.0,
                                  ),
                                  labelStyle: TextStyle(
                                    fontFamily: Constants.appFont2,
                                    color: Colors.grey,
                                    fontSize: 13.0,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "this field is required";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Container(
                              height: height * 0.07,
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                    size: 20.0,
                                  ),
                                  labelStyle: TextStyle(
                                    fontFamily: Constants.appFont2,
                                    color: Colors.grey,
                                    fontSize: 13.0,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "this field is required";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isProgress = !isProgress;
                            });
                            _validateData(context, firebaseProvider);
                          },
                          child: Container(
                            width: width * 0.72,
                            height: height * 0.065,
                            decoration: BoxDecoration(
                              color: Colors.red[300],
                              borderRadius: BorderRadius.circular(17.0),
                            ),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: Constants.appFont2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Do not have an account?",
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: Constants.appFont2,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop(context);
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: Constants.appFont2,
                                color: Colors.red[600],
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // this method is used to validate the data
  void _validateData(BuildContext context, FirebaseBloc firebaseProvider) {
    UserModel userModel =
        UserModel.loginModel(email: email, password: password);

    if (formKey.currentState.validate()) {
      firebaseProvider.userModel = userModel;
      firebaseProvider.add(
        LoginEvents(),
      );
      if (firebaseProvider.response == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (c) => Home(),
          ),
        );
      } else {
        scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text("there is a wrong in email or password"),
          ),
        );
      }
    }
  }
}
