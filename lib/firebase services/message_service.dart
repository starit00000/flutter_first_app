
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_first_app/main.dart';

class MessageService{

  var firebaseDatabase = FirebaseDatabase.instance;
  var msgRef = FirebaseDatabase.instance.reference().child('Message');

  void sendMessage(String message) async {
    await msgRef.push().set(message)
        .then((value) {
      print('Message sent successfully');
    }).catchError((error) {
      print(error.toString());
    });
  }

  //single value event listener
  Future<List<dynamic>> getMessageList() async {
    List<dynamic> list = [];
    await msgRef.once().then((snapshot) {
      Map<dynamic, dynamic> msgMap = snapshot.value;
      msgMap.forEach((key, value) {
        list.add(value);
      });
    });
    return list;
  }

  Future<List<dynamic>> funny() async {
    List<dynamic> list = [];
    await msgRef.onValue.listen((event) {
      print(event.toString());
    });
  }

}