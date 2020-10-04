import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/firebase%20services/message_service.dart';

class ChatListWidget extends StatefulWidget {
  @override
  _ChatListWidgetState createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  final MessageService messageService = new MessageService();
  List<dynamic> messageList = new List();



  @override
  Widget build(BuildContext context) {
    var ref = FirebaseDatabase.instance.reference().child('Message');
    List<String> list = [];

    // controllers
    final _listVIewController = new ScrollController();
    // initialize listview controller
    _listVIewController.animateTo(
      _listVIewController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );

    return StreamBuilder(
      stream: ref.onValue,
      builder: (context, AsyncSnapshot<Event> snapshot) {
        messageList.clear();
        if (snapshot.hasData) {
          DataSnapshot shot = snapshot.data.snapshot;
          Map<dynamic, dynamic> map = shot.value;
          var newMap = Map.fromEntries(
              map.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
          //int.parse(e1.value["SortOrder"]).compareTo(int.parse(e2.value["SortOrder"]))));
          if (newMap != null) {
            newMap.forEach((key, value) {
              messageList.add(value.toString());
            });
          }
          print(list);
          return ListView.builder(
            scrollDirection: Axis.vertical,
            controller: _listVIewController,
            shrinkWrap: true,
            reverse: true,
            itemCount: messageList.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(messageList[index]),
                ),
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
