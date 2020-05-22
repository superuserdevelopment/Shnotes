import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF59C3A5),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hola!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60.0,
                        fontFamily: 'Calibre',
                      ),
                    ),
                  qrButton(),
                  ],
              ),
              ),
              UpdatesBar(),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          //key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.bubble_chart, size: 40),
            Icon(Icons.list, size: 40),
            Icon(Icons.landscape, size: 40),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Color(0xFF59C3AC),
          animationCurve: Curves.easeOut,
          animationDuration: Duration(milliseconds: 400),
          onTap: (index) {
//      setState(() {
//        //_page = index;
//      });
          },
        ));
  }
}

class UpdatesBar extends StatefulWidget {
  @override
  _UpdatesBarState createState() => _UpdatesBarState();
}

class _UpdatesBarState extends State<UpdatesBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(37.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[700],
                blurRadius: 5.0,
                spreadRadius: 2.0,
                offset: Offset(2, 2),
              )
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Color(0xFF59C3A5),
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Today\'s Updates',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 30.0,
                      fontFamily: 'Calibre',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      subCards('Completed', '17'),
                      subCards('   Pending   ', '5'),
                      subCards('       New      ', '3'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// Use this widget to update the UpdateCard
Widget subCards(String title, String value){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
    child: Container(
      //height: 70.0,
      
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFF59C3A5),
          borderRadius: BorderRadius.all(Radius.circular(17.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[700],
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(1, 2),
            )
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {

          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontFamily: 'Calibre',
                  ),
                ),
                Text(
                  '$value',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontFamily: 'Calibre',
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
Widget qrButton(){
  return Container(
    width: 55.0,
    height: 55.0,
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 2.0,
          spreadRadius: 2.0,
          color: Colors.grey[700],
          offset: Offset(1,2),
        )
      ],
      image: DecorationImage(
        image: AssetImage('assets/images/icons8-qr-code-90.png')
      )
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Color(0xFF59C3A5),
        onTap: (){
          //Write Code to Scan QR Code
        },
      ),
    ),
  );
}