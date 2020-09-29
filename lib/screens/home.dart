import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/screens/BottomNavigationScreen.dart';
import 'package:http/http.dart' as http;

import 'ChatScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> list = [
    'Zero',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                color: Colors.blue,
                child: Text(
                  'Bottom Navigation',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _navigateToBottom(context);
                },
              ),
              Container(
                child: FlatButton(
                  color: Colors.blue,
                  child: Text('Firebase Chat', style: TextStyle(color: Colors.white),),
                  onPressed: () => _navigateToChatScreen(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToBottom(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
  }

  void _navigateToChatScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
  }
}
