import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'side_drawer.dart';
import 'song_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Music'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isPlaying = false;

  void _playPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _skipNext() {

  }

  void _skipPrev() {

  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SongList(),
      ),
      drawer: SideDrawer(),
      bottomNavigationBar: Stack(
        
          children: [
            new Container(
              height: 100.0,
              color: Colors.grey[800],
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              top: 0.0,
              bottom: 0.0,
              child: Column(
                children: [ 
                  Row( 
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                new Container(
                  height: 6.0,
                  width: MediaQuery.of(context).size.width * 2.0/3.0,
                  alignment: Alignment.topLeft,
                  color: Colors.lightBlue,
                )]),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(onPressed: _skipPrev, child : Icon(Icons.replay, size: 26.0)),
                    FlatButton(onPressed: _skipNext, child : Icon(Icons.skip_previous, size: 42.0)),
                    FlatButton(onPressed: _playPause, child : _isPlaying ? Icon(Icons.pause, size: 46.0) : Icon(Icons.play_arrow, size: 46.0)),
                    FlatButton(onPressed: _skipPrev, child : Icon(Icons.skip_next, size: 42.0)),
                    FlatButton(onPressed: _skipPrev, child : Icon(Icons.repeat, size: 26.0)),
                    
                ]),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(onPressed: _skipPrev, child : Image(image: FileImage( File("assets/images/test.jpeg")), width: 42,)),
                    FlatButton(onPressed: _skipNext, child : Icon(Icons.skip_previous, size: 42.0)),
                ])
                ]),

            ),
          ],
      ),


    );
  }
}
