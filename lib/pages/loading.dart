import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getData()async{
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushNamed(context, '/home');
  }
  @override
  void initState() {
    super.initState();
    //getData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF59C3A5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Icon(Icons.bubble_chart,
//              color: Colors.white,
//              size: 100.0,
//            ),
          //Hello
            SpinKitChasingDots(
              size: 100.0,
              color: Colors.white,
            ),
            SizedBox(height: 10.0,),
            Text(
              'Shnotes',
              style: TextStyle(
                  fontFamily: 'Calibre',
                  color: Colors.white,
                  fontSize: 50.0
              ),
            ),
          ],
        )
      ),
      bottomNavigationBar: _company(),
    );
  }
}
Widget _company(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'superuserdev </>',
        style: TextStyle(
            fontFamily: 'Calibre',
            color: Colors.white,
            fontSize: 30.0
        ),
      ),
    ],
  );
}