import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shrotes/services/auth.dart';
import 'package:shrotes/models/notes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = List<Note>();

  final AuthenticationService _auth = AuthenticationService();

  @override
  void initState() {
    super.initState();
    notes.add(Note(
      client: 'Mom',
      avatar: NetworkImage(
          'https://images.unsplash.com/photo-1536861028716-5e0d30fe7387?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
    ));
    notes[0].items.add(NoteItem(content: 'Milk', client: 'Mom'));
    notes[0].items.add(
        NoteItem(content: 'Cadbury Oreo', client: 'Mom', isComplete: true));
    notes[0].items.add(NoteItem(content: 'Whole Wheat Bread', client: 'Mom'));
    notes[0].items.add(NoteItem(content: 'Gillete Razor', client: 'Dad'));
    notes[0].items.add(NoteItem(content: 'Shaving Foam', client: 'Dad'));
    notes[0].items.add(NoteItem(content: 'Toothpaste', client: 'Dad'));
    notes.add(Note(
        client: 'Dad',
        avatar: NetworkImage(
            'https://images.unsplash.com/photo-1589893934875-cd3bc288b275?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80')));
    notes[1].items.add(NoteItem(content: 'Gillete Razor', client: 'Dad'));
    notes[1].items.add(NoteItem(content: 'Shaving Foam', client: 'Dad'));
    notes[1].items.add(NoteItem(content: 'Toothpaste', client: 'Dad'));
    notes.add(Note(
      client: 'Mom',
      avatar: NetworkImage(
          'https://images.unsplash.com/photo-1536861028716-5e0d30fe7387?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
    ));
    notes[2].items.add(NoteItem(content: 'Milk', client: 'Mom'));
    notes[2].items.add(NoteItem(content: 'Cadbury Oreo', client: 'Mom'));
    notes[2].items.add(NoteItem(content: 'Whole Wheat Bread', client: 'Mom'));
  }

  @override
  Widget build(BuildContext context) {
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
                    RaisedButton(
                      child: Text('Log Out'),
                      onPressed: () async {
                        await _auth.signOut();
                      },
                    ),
                    qrButton(),
                  ],
                ),
              ),
              UpdatesBar(),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return NotesOverlook(note: notes[index]);
                    }),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          //key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(
              Icons.bubble_chart,
              size: 30,
            ),
            Icon(Icons.list, size: 30),
            Icon(Icons.landscape, size: 30),
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

//This need extensive Functionality
class UpdatesBar extends StatefulWidget {
  @override
  _UpdatesBarState createState() => _UpdatesBarState();
}

class _UpdatesBarState extends State<UpdatesBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              elevation: 10.0,
              child: Container(
          width: MediaQuery.of(context).size.width - 20,
          // decoration: BoxDecoration(
          //     shape: BoxShape.rectangle,
          //     color: Colors.white,
          //     borderRadius: BorderRadius.all(Radius.circular(37.0)),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey[700],
          //         blurRadius: 5.0,
          //         spreadRadius: 2.0,
          //         offset: Offset(2, 2),
          //       )
          //     ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Color(0xFF59C3A5),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Today\'s Updates',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 25.0,
                        fontFamily: 'Calibre',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      ),
    );
  }
}

// Use this widget to update the UpdateCard
Widget subCards(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
    child: Card(
      color: Color(0xFF59C3A5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10.0,
          child: Container(        
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white,
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                      fontSize: 40.0,
                      fontFamily: 'Calibre',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget qrButton() {
  return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
      width: 55.0,
      height: 55.0,
      decoration: BoxDecoration(          
          image: DecorationImage(
              image: AssetImage('assets/images/icons8-qr-code-90.png'))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Color(0xFF59C3A5),
          onTap: () {
            //Write Code to Scan QR Code
          },
        ),
      ),
    ),
  );
}

class NotesOverlook extends StatelessWidget {
  Note note;
  bool isNew;

  NotesOverlook({this.note, this.isNew});

  @override
  Widget build(BuildContext context) {
    if (note == null) {
      note = Note(client: 'Error');
    }
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Card(
          elevation: 10.0,
          color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
            width: MediaQuery.of(context).size.width - 30,
            height: 200.0,
            // decoration: BoxDecoration(
            //     shape: BoxShape.rectangle,
            //     color: Colors.white,
            //     borderRadius: BorderRadius.all(Radius.circular(37.0)),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey[700],
            //         blurRadius: 5.0,
            //         spreadRadius: 2.0,
            //         offset: Offset(2, 2),
            //       )
            //     ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Color(0xFF59C3A5),
                onTap: () {
                  //add code to open the full notes view
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          
                          children: <Widget>[
                            //
                            Image(
                              image: AssetImage('assets/images/note_icon.png'),
                              fit: BoxFit.fill,
                              height: 90,
                            ),
                            //List of Items
                            Card(
                              color: Theme.of(context).primaryColor,
                              elevation: 6.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                child: Container(
                              width: (MediaQuery.of(context).size.width - 110) *
                                  4 /
                                  5 - 10,
                              height: 90,                            
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 12.0),
                                    child: ListView.builder(
                                        itemCount: note.items.length,
                                        itemBuilder: (context, index) {
                                          if (note.items == null) {
                                            print('Test2');
                                            return Text(
                                              'Error',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontFamily: 'Calibre',
                                                  color: Colors.white),
                                            );
                                          } else {
                                            return Text(
                                              '${note.items[index].content}',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontFamily: 'Calibre',
                                                  color: Colors.white),
                                            );
                                          }
                                        }),
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        //Lower Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 110) / 20 -
                                      10,
                            ),
                            //Client Image
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 1.0,
                                        blurRadius: 3.0,
                                        color: Colors.grey[700],
                                        offset: Offset(2, 2))
                                  ]),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF59C3A5),
                                backgroundImage: note.avatar,
                                radius: 25.0,
                              ),
                            ),
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 110) / 20,
                            ),
                            //Time and Client Information tab
                            Card(
                              color: Theme.of(context).primaryColor,
                              elevation: 6.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                // width: (MediaQuery.of(context).size.width - 110) *
                                //     4 /
                                //     5,
                                // height: 50,
                                // decoration: BoxDecoration(
                                //     color: Color(0xFF59C3A5),
                                //     shape: BoxShape.rectangle,
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(17.0)),
                                //     boxShadow: [
                                //       BoxShadow(
                                //           spreadRadius: 1.0,
                                //           blurRadius: 3.0,
                                //           color: Colors.grey[700],
                                //           offset: Offset(2, 2))
                                //     ]),
                                
                                child: Container(
                                  width: (MediaQuery.of(context).size.width - 110) *
                                    4 /
                                    5,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 12.0),
                                    child: ListView(
                                      children: <Widget>[
                                        Text(
                                          'from ${note.client} at ${note.inTime.toIso8601String().substring(11, 16)}',
                                          //'from Mom at 9:15',
                                          style: TextStyle(
                                              fontFamily: 'Calibre',
                                              color: Colors.white,
                                              fontSize: 22.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        )
                      ],
                    )),
              ),
            ),
          ),
        ));
  }
}

//noteOverlook(List<Note> items, Image avatar, bool isNew) {



  


