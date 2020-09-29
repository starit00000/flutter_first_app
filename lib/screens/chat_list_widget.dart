import 'package:firebase_database/firebase_database.dart';
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
  void initState() {
    print('initState()');
    Future<List<dynamic>> futureMsgList = messageService.getMessageList();
    futureMsgList.then((value) => messageList = value);
    print(messageList);
  }

  @override
  void didUpdateWidget(ChatListWidget old) {
    super.didUpdateWidget(old);
    print('didUpdateWidget()');
    Future<List<dynamic>> futureMsgList = messageService.getMessageList();
    futureMsgList.then((value) => messageList = value);
    print(messageList);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: messageList.length,
      itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.all(10),
          child: Text(messageList[index].toString()),
        );
      },
    );



  }


}
