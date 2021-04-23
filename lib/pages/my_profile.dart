import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldnews/components/action_widget.dart';
import 'package:worldnews/constants.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_bloc.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_events.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_states.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var blocProvider = BlocProvider.of<FirebaseBloc>(context);
    blocProvider.add(FetchUserData());

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                children: [
                  ActionWidget(
                    onClick: () {
                      Navigator.of(context).pop(context);
                    },
                    icon: Icons.arrow_back_ios_rounded,
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Text(
                    "My Profile",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: Constants.appFont2,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: CircleAvatar(
                  radius: 30.0,
                  child: Image(
                    image: AssetImage(Constants.userImage),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              BlocBuilder<FirebaseBloc, FirebaseStates>(
                builder: (context, state) {
                  bool result;
                  var response;
                  if (state is LoadingState) {
                    result = false;
                  } else if (state is LoadedState) {
                    result = true;
                    response = state.response;
                  } else {
                    result = false;
                  }
                  return FutureBuilder<DocumentSnapshot>(
                    future: response,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        result = false;
                      }
                      return Column(
                        children: [
                          Container(
                            height: height * 0.06,
                            width: width * 0.4,
                            padding: EdgeInsets.only(
                              left: 8.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                result == false
                                    ? "User Name"
                                    : snapshot.data["name"],
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: Constants.appFont2,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Container(
                            height: height * 0.06,
                            width: width * 0.4,
                            padding: EdgeInsets.only(
                              left: 8.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                result == false
                                    ? "Email"
                                    : snapshot.data["email"],
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: Constants.appFont2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.red[300],
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    child: Center(
                      child: Text(
                        "Log Out",
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
            ],
          ),
        ),
      ),
    );
  }
}
