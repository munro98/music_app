import 'package:flutter/material.dart';

class PlayerBar extends StatefulWidget {
  PlayerBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PlayerBarState createState() => _PlayerBarState();
}

class _PlayerBarState extends State<PlayerBar> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              //padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Song name'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                  },
                ),
                ListTile(
                  title: Text('Item 3'),
                  onTap: () {
                  },
                )
              ],
            ),
          );
  }
}