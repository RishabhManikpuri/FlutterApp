import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/Album.dart';

final _albumList = List<Album>();

Future<List<Album>> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> values = new List<dynamic>();
    values = json.decode(response.body);
    if (values.length > 0) {
      for (int i = 0; i < values.length; i++) {
        if (values[i] != null) {
          Map<String, dynamic> map = values[i];
          _albumList.add(Album.fromJson(map));
          debugPrint('title-------${map['title']}');
        }
      }
    }
    return _albumList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data From API'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.purple, Colors.blue[900]])),
        ),
      ),
      body: Center(
          child: FutureBuilder(
              future: futureAlbum,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return _buildList();
                }
              })),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      separatorBuilder: (context, index) =>
          Divider(color: Colors.black12, thickness: 1),
      itemCount: _albumList.length,
      itemBuilder: (context, i) {
        return _buildRow(_albumList[i], i);
      },
    );
  }

  Widget _buildRow(Album demoStr, int index) {
    return Material(
      child: Container(
        child: ListTile(
            title: Text(demoStr.title), trailing: Text(demoStr.id.toString())),
      ),
    );
  }
}
