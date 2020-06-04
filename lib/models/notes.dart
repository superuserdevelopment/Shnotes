import 'package:flutter/material.dart';

class Note {
  List<NoteItem> items = List<NoteItem>();
  bool isComplete;
  String client;
  String reciever;
  DateTime inTime;
  NetworkImage avatar;
  Note({this.client, this.inTime, this.avatar, this.reciever}) {
    if (inTime == null) {
      inTime = DateTime.now();
    }
  }
  void appendItems(String content) {
    try {
      items.add(NoteItem(
          content: content,
          client: client,
          isComplete: false,
          inTime: DateTime.now()));
    } catch (e) {
      print('Adding Unsucessful');
      print(e);
    }
  }

  void removeCompleted() {
    int i;
    List<NoteItem> items1 = List<NoteItem>();
    for (i = 0; i < items.length; i++) {
      if (items[i].isComplete == false) {
        items1.add(items[i]);
      }
    }
    print(items1);
    items = items1;
  }

  void removeItem(int id) {
    items.removeAt(id);
  }
}

class NoteItem {
  String content;
  bool isComplete = false;
  String client;
  String reciever;
  DateTime inTime;
  NoteItem({this.content, this.client, this.isComplete, this.inTime, this.reciever}) {
    if (inTime == null) {
      inTime = DateTime.now();
    }
    if (isComplete == null) {
      isComplete = false;
    }
  }
}
