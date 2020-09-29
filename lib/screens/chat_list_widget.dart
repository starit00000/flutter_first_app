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
  void didUpdateWidget(ChatListWidget old) {
    super.didUpdateWidget(old);
    /*print('didUpdateWidget()');
    Future<List<dynamic>> futureMsgList = messageService.getMessageList();
    futureMsgList.then((value) => messageList = value);
    print(messageList);*/
  }

  @override
  Widget build(BuildContext context) {

    var ref = FirebaseDatabase.instance.reference().child('Message');
    List<String> list = [];

    return StreamBuilder(
      stream: ref.onValue,
      builder: (context, AsyncSnapshot<Event> snapshot){
        messageList.clear();
        if(snapshot.hasData){
          DataSnapshot shot = snapshot.data.snapshot;
          Map<dynamic, dynamic> map = shot.value;
          if(map != null){
            map.forEach((key, value) {
              messageList.add(value.toString());
            });
          }
          print(list);
          return ListView.builder(
            reverse: true,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
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
