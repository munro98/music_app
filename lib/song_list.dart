import 'package:flutter/material.dart';


class Song {
  Song(this.index, this.artist, this.name, this.length);
  final index;
  final artist;
  final name;
  final length;
}

class SongList extends StatefulWidget {
  SongList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SongListState createState() => _SongListState();
}

class SongItem extends StatelessWidget {
  const SongItem(this.l, this.crt);

  final Song l;
  final _SongListState crt;

  Widget _buildTiles(Song root, BuildContext context) {
    return new Container(
        color: root.index % 2 == 0 ? Colors.grey[200] : Colors.grey[20],
       child: ListTile(title: new Text(root.artist + " - " + root.name + " (" + root.index.toString() + ")")));
    /*
    return GestureDetector(
        onHorizontalDragStart: (DragStartDetails d) {
          print("dragStart");
        },
        onHorizontalDragEnd: (DragEndDetails d) async {
          print("dragEnd");

        },
        child: Row(children: [
          new Align(
            alignment: Alignment.topLeft,
            child: Column(children: [
              Icon(Icons.arrow_upward),
              Text(l.score.toString()), //l.score.toString()
              Icon(Icons.arrow_downward)
            ]),
          ),
          InkWell(
            splashColor: Colors.deepOrange,
            highlightColor: Colors.deepPurple,
            onTap: () {
              print('openLink');
              _navigateToLink(l.url);
            },
            child:
            new Align(
              alignment: Alignment.topLeft,
            child:
            l.thumbnail != null && l.thumbnail != '' ?
            new Image.network(l.thumbnail, fit: BoxFit.fitWidth, width: 60.0,) :
            Icon(Icons.message, size: 60.0) , // Icons.font_download Icons.link
            )

          ),
          new Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                InkWell(
                  splashColor: Colors.deepOrange,
                  highlightColor: Colors.deepPurple,
                  onTap: () {
                    print('tap2!');
                    _navigateToComments(context, l.permalink);
                  },
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l.title + ' (' + l.domain + ')',
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                        //Text('<title> (<site>)'),
                        Text(Utils.getTimeSincePost(l.created_utc) +
                            ' ago by ' +
                            l.author) //Text('<hrs> ago by (<user>)')
                      ]),
                ),
                Text(l.num_comments.toString() +
                    ' ' +
                    '💬' +
                    ' ' +
                    l.subreddit) //Text('<cmts> (<sub>)')
              ]))
        ]));*/
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(l, context);
  }
}


class _SongListState extends State<SongList> {
  int _counter = 0;

  List<Song> _songs = <Song>[];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 100; i++)
      _songs.add(new Song(i, "ArtistName", "Song", 123));

    //print(" initState" + _posts.length.toString());
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
    return 
              new ListView.builder(
                itemExtent: 40.0,
                itemCount: _songs.length,
                itemBuilder: (BuildContext context, int index) {
                  return new SongItem(_songs[index], this);
                },
              )
          ;
  }
}
/*
ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    ListTile(title: new Text(" sdasdg - asdg")),
    ListTile(title: new Text(" sdasdg - asdg"))
    ],)
    */