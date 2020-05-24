import 'package:flutter/material.dart';
import 'package:shrotes/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:shrotes/models/user.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthenticationService _auth = AuthenticationService();
  final Color primary = Color(0xFF59C3A5);
  @override
  Widget build(BuildContext context) {
    final dynamic user = Provider.of<User>(context);
    print('Stream: '+user.toString());
    return Scaffold(
        backgroundColor: const Color(0xFF59C3A5),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  'Hola! Let\'s get started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: 'Calibre',
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Builder(
                    builder: (context) => RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                        child: Text(
                      'Sign-in Anynomously',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Calibre'
                      ),
                    ),
                        onPressed: () async{
                          dynamic res = await _auth.signInAnon();
                          String message ='Network Error';
                          if(res!=null){
                            print(res.uid);
                            message = 'Anonymous Sign-in Successful';
                            Navigator.pushNamed(context, '/home');
                          }
                          Scaffold.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(message, style: TextStyle(color: Colors.black, fontFamily: 'Calibre', fontSize: 20.0),),
                            duration: Duration(seconds: 3),
                          ));
                        }),
                  ),
//                  child: RaisedButton(
//                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
//                    onPressed: ()async{
//                      dynamic res = await _auth.signInAnon();
//                      print(res);
//                    },
//                    child: Text(
//                      'Sign-in Anynomously',
//                      style: TextStyle(
//                        fontSize: 30.0,
//                        fontFamily: 'Calibre'
//                      ),
//                    ),
//                  ),
                ),
              )

            ]
            )
        )
    );
  }
}
