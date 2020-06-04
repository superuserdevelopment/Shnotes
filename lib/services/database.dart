import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersCollection = Firestore.instance.collection('Users');

  Future updateUserData(String name, String email,)async {
    return await usersCollection.document(uid).setData(
      {
        'Name' : name,
        'Email' : email,
      }
    );
  }  
}