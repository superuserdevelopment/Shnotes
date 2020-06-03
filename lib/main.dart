import 'package:flutter/material.dart';
import 'package:shrotes/pages/home.dart';
import 'package:shrotes/pages/loading.dart';
import 'package:shrotes/pages/SignIn.dart';
import 'package:provider/provider.dart';
import 'package:shrotes/models/user.dart';
import 'package:shrotes/services/auth.dart';
import 'package:shrotes/services/wrapper.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
    value: AuthenticationService().user,
      child: MaterialApp(
        title: 'Shnotes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFF59C3A5),
          accentColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Circular',
                bodyColor: Colors.white,
                displayColor: Colors.white),
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      initialRoute: '/wrapper',


        routes: {
          '/' : (context)=>LoadingScreen(),
          '/home' : (context)=>HomePage(),
          '/signin' : (context)=>SignIn(),
          '/wrapper' : (context)=>Wrapper(),
        },
      ),
    );
  }
}

