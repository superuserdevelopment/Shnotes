import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shrotes/pages/loading.dart';
import 'package:shrotes/services/auth.dart';
import 'package:shrotes/services/database.dart';
import 'package:provider/provider.dart';
import 'package:shrotes/models/user.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthenticationService _auth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //Credentials
  String email = '';
  String password = '';
  String name = '';
  bool isRegistering = false;
  bool emailFocus = false;
  bool passFocus = false;
  bool nameFocus = false;
  @override
  Widget build(BuildContext context) {
    //final dynamic user = Provider.of<User>(context);
    //print('Stream: ' + user.toString());
    _PatternVibrate() {
      HapticFeedback.mediumImpact();

      // sleep(
      //   const Duration(milliseconds: 200),
      // );

      // HapticFeedback.mediumImpact();

      // sleep(
      //   const Duration(milliseconds: 500),
      // );
      // HapticFeedback.mediumImpact();
    }

    return loading
        ? LoadingScreen()
        : Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: SafeArea(
                child: ListView(children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  'Hola! Welcome back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                  ),
                ),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              //Sign in Card
                              Card(
                                elevation: isRegistering ? 0.0 : 10.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: isRegistering
                                        ? null
                                        : Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 4.0),
                                  ),
                                  child: Material(
                                    child: InkWell(
                                      onTap: () {
                                        HapticFeedback.mediumImpact();
                                        setState(() {
                                          isRegistering = false;
                                        });
                                      },
                                      child: Text(
                                        'Sign-in',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: isRegistering ? 10.0 : 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: isRegistering
                                        ? Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 4.0)
                                        : null,
                                  ),
                                  child: Material(
                                    child: InkWell(
                                      onTap: () {
                                        HapticFeedback.mediumImpact();
                                        setState(() {
                                          isRegistering = true;
                                        });
                                      },
                                      child: Text(
                                        'Sign-up',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //name
                          Visibility(
                            visible: isRegistering,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Card(
                                elevation: nameFocus ? 10.0 : 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                color: Theme.of(context).primaryColor,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 20.0),
                                  child: TextFormField(
                                    onTap: () {
                                      setState(() {
                                        nameFocus = true;
                                        emailFocus = false;
                                        passFocus = false;
                                      });
                                    },
                                    validator: (val) =>
                                        val.isEmpty && isRegistering
                                            ? 'Enter your Name'
                                            : null,
                                    cursorColor: Theme.of(context).accentColor,
                                    decoration: InputDecoration(
                                        hintText: 'Name',
                                        hintStyle:
                                            TextStyle(color: Colors.grey[700],fontSize: 20.0),
                                        errorStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                        errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green)),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[600])),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        name = val;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          //email
                          Card(
                            elevation: emailFocus ? 10.0 : 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            color: Theme.of(context).primaryColor,
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                              child: TextFormField(
                                onTap: () {
                                  setState(() {
                                    emailFocus = true;
                                    passFocus = false;
                                    nameFocus = false;
                                  });
                                },
                                validator: (val) => val.isEmpty
                                    ? 'Enter a valid email address'
                                    : null,
                                cursorColor: Theme.of(context).accentColor,
                                decoration: InputDecoration(
                                    hintText: 'Email Address',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700], fontSize: 20.0),
                                    errorStyle: TextStyle(
                                        color: Colors.white, fontSize: 12.0),
                                    errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[600])),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    email = val;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          //password
                          Card(
                            elevation: passFocus ? 10.0 : 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            color: Theme.of(context).primaryColor,
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                              child: TextFormField(
                                onTap: () {
                                  setState(() {
                                    emailFocus = false;
                                    passFocus = true;
                                    nameFocus = false;
                                  });
                                },
                                validator: (val) => val.length > 5
                                    ? null
                                    : 'Enter a password with 6 or more characters',
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700], fontSize: 20.0),
                                    errorStyle: TextStyle(
                                        color: Colors.white, fontSize: 12.0),
                                    errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[600])),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() {
                                    password = val;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Card(
                            color: Theme.of(context).accentColor,
                            elevation: 10.0,
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 60,
                              height: 65.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    left: 0.0,
                                    child: Draggable(
                                      onDragEnd: (vel) async {
                                        if (vel.offset.direction < 1.5) {
                                          print('Swipe Right');
                                          if (isRegistering) {
                                            HapticFeedback.mediumImpact();
                                            if (_formKey.currentState
                                                .validate()) {
                                              print(name);
                                              print(email);
                                              print(password);
                                              setState(() {
                                                loading = true;
                                              });
                                              dynamic result =
                                                  await _auth.registerWithEmail(
                                                      email, password);

                                              if (result.runtimeType ==
                                                  String) {
                                                showAlertDialog(
                                                    'Oops', result, context);
                                                setState(() {
                                                  loading = false;
                                                });
                                              } else {
                                                await DatabaseService(
                                                        uid: result.uid)
                                                    .updateUserData(
                                                        name, email);
                                              }
                                            }
                                          } else {
                                            HapticFeedback.mediumImpact();
                                            if (_formKey.currentState
                                                .validate()) {
                                              print('Signing you in');
                                              setState(() {
                                                loading = true;
                                              });
                                              dynamic result = await _auth
                                                  .signInEmail(email, password);
                                              if (result.runtimeType ==
                                                  String) {
                                                showAlertDialog(
                                                    'Oops', result, context);
                                                setState(() {
                                                  loading = false;
                                                });
                                              }
                                            }
                                          }
                                        }
                                      },
                                      axis: Axis.horizontal,
                                      feedback: Container(
                                        height: 60.0,
                                        width: 60.0,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 40.0,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey[600],
                                                offset: Offset(2, 3),
                                                blurRadius: 10.0,
                                                spreadRadius: 2.0,
                                              )
                                            ]),
                                      ),
                                      childWhenDragging: Container(
                                        height: 60.0,
                                        width: 60.0,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 40.0,
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
                                      child: Container(
                                        height: 60.0,
                                        width: 60.0,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 40.0,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey[600],
                                                offset: Offset(0, 3),
                                                blurRadius: 5.0,
                                                spreadRadius: 1.0,
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 14.0,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 18),
                                      child: Text(
                                        'Swipe Right to Continue',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
            ])));
  }
}

Future<void> showAlertDialog(
    String title, String message, BuildContext context) {
  return (showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 24.0, fontFamily: 'Circular'),
          backgroundColor: Theme.of(context).primaryColor,
          content: Text(
            message,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      }));
}
