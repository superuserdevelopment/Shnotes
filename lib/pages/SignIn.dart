import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrotes/pages/loading.dart';
import 'package:shrotes/services/auth.dart';
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

  bool emailFocus = false;
  bool passFocus = false;
  @override
  Widget build(BuildContext context) {
    //final dynamic user = Provider.of<User>(context);
    //print('Stream: ' + user.toString());
    return loading ? LoadingScreen() : Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child:
                ListView( children: <
                    Widget>[
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
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                      Text(
                        'Sign-in / Sign-up',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 30,
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
                              });
                            },
                            validator: (val) => val.isEmpty
                                ? 'Enter a valid email address'
                                : null,
                            cursorColor: Theme.of(context).accentColor,
                            decoration: InputDecoration(
                                hintText: 'Email Address',
                                hintStyle: TextStyle(color: Colors.grey[700]),
                                errorStyle: TextStyle(
                                    color: Colors.white, fontSize: 14.0),
                                errorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[600])),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            style: TextStyle(
                              fontSize: 22.0,
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
                              });
                            },
                            validator: (val) => val.length > 5
                                ? null
                                : 'Enter a password with 6 or more characters',
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey[700]),
                                errorStyle: TextStyle(
                                    color: Colors.white, fontSize: 14.0),
                                errorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[600])),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            style: TextStyle(
                              fontSize: 22.0,
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border:Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2.0
                            ),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 14.0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 24.0
                                    ),
                                ),
                              ),
                              ),
                              Center(
                                child: Draggable(
                                  onDragEnd: (vel) async{
                                    if(vel.offset.direction > 1.4){
                                      print('Swipe Left');
                                      if(_formKey.currentState.validate()){
                                        print('Signing you in');
                                        setState(() {
                                          loading = true;
                                        });
                                        dynamic result = await _auth.signInEmail(email, password);
                                        if(result.runtimeType == String){
                                          showAlertDialog('Oops', result, context);
                                          setState(() {
                                            loading = false;
                                          });
                                        }
                                      }
                                    }
                                    else if(vel.offset.direction < 0.98){
                                      print('Swipe Right');
                                      if(_formKey.currentState.validate()){
                                        print('Signing you up');
                                        setState(() {
                                          loading = true;
                                        });
                                        dynamic result = await _auth.registerWithEmail(email, password);
                                        if(result.runtimeType == String){
                                          showAlertDialog('Oops', result, context);
                                          setState(() {
                                            loading = false;
                                          });
                                        }                                      
                                      }
                                    }
                                  },
                                  axis: Axis.horizontal,
                                  feedback: Container(
                                    height: 60.0,
                                    width: 60.0,  
                                    child: Icon(
                                      Icons.bubble_chart,
                                      color: Colors.white,
                                      size: 40.0,
                                    ),                            
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor,
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey[600],
                                        offset: Offset(2,3),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      )]
                                    ),
                                    ),
                                    childWhenDragging: Container(
                                    height: 60.0,
                                    width: 60.0,       
                                    child: Icon(
                                      Icons.bubble_chart,
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
                                      Icons.bubble_chart,
                                      color: Colors.white,
                                      size: 40.0,
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor,
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey[600],
                                        offset: Offset(0,3),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      )]
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 14.0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 24.0
                                    ),
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

Future<void> showAlertDialog(String title, String message, BuildContext context){
  return(
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text(title),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24.0, fontFamily: 'Circular'),
          backgroundColor: Theme.of(context).primaryColor,
          content: Text(
            message,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      }
      )
  );
}
