import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrotes/models/user.dart';
import 'package:shrotes/pages/home.dart';
import 'package:shrotes/pages/SignIn.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    if(user != null){
      return HomePage();
    }
    else{
      return SignIn();
    }
  }
}

