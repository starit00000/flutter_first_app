import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  static List<String> _phoneList = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten',
    'Eleven',
    'Twelve',
    'Thirteen',
    'Fourteen',
    'Fifteen',
    'Sixteen',
    'Seventeen',
    'Eighteen',
    'Nineteen',
    'Twenty',
    'Twenty One',
    'Twenty two'
  ];

  static List<Widget> _widgetList = [
    _phoneWidget(),
    _emailWidget(),
    _radioWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigation'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), title: Text('Phone')),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline), title: Text('Email')),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio), title: Text('Radio')),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.lightBlue,
        onTap: _onItemTapped,
      ),
      body: _widgetList[_selectedIndex],
    );
  }

  static Container _phoneWidget() {
    return Container(
      //child: SizedBox.expand()
      child: ListView.separated(
        padding: EdgeInsets.all(3),
        itemCount: _phoneList.length,
        itemBuilder: (context, index) {
          return Material(
            child: Ink(
              color: Colors.lightBlue,
              child: InkWell(
                  splashColor: Colors.black26,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    //color: Colors.lightBlue,
                    child: Center(
                      child: Text(
                        _phoneList[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () => Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          index.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.blue,
                        behavior: SnackBarBehavior.floating,
                      ))),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 0,
            color: Colors.white,
          );
        },
      ),
    );
  }

  static Container _emailWidget() {
    return Container();
  }

  static Container _radioWidget() {
    return Container();
  }
}
