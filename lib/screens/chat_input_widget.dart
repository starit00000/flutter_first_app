import 'package:flutter/material.dart';
import 'package:flutter_first_app/firebase%20services/message_service.dart';

class ChatInputWidget extends StatefulWidget {
  @override
  _ChatInputWidgetState createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final messageService = new MessageService();
  final msgController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              height: 45,
              margin: EdgeInsets.only(right: 5),
              child: TextField(
                controller: msgController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    hintText: 'Message',
                    //labelText: 'Message'
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: FlatButton(
              child: Text(
                'Send',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                String txt = msgController.text;
                if(txt != null && txt.isNotEmpty){
                  messageService.sendMessage(txt);
                  msgController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
