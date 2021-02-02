import 'package:flutter/material.dart';
import 'ListWithAPICall.dart';
import 'RandomWordsList.dart';
import 'ExpansionListDemo.dart';
import 'ListWithDifferentViews.dart';
import 'BottomNavigationBar.dart';
import 'TabLayoutPage.dart';
import 'ButtonsDesignDemo.dart';
import 'LoginPage.dart';
import 'ReturnDataFromSecondPage.dart';

class DemoList extends StatefulWidget {
  @override
  DemoListState createState() => new DemoListState();
}

class DemoListState extends State<DemoList> {
  final _demoList = <String>[
    "Random Words List",
    "ExpansionListDemo",
    "ListWithDifferentHeader",
    "BottomNavigationDemo",
    "TabLayoutDemo",
    "ButtonDesignsDemo",
    "LoginPageDemo",
    "PassingDataFromPreviousScreen",
    "ListWithAPICall"
  ];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  String _title = 'Flutter Demos';

  String _title1 = 'Flutter Demos';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.purple, Colors.blue[900]])),
        ),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      separatorBuilder: (context, index) =>
          Divider(color: Colors.black12, thickness: 1),
      itemCount: _demoList.length,
      itemBuilder: (context, i) {
        return _buildRow(_demoList[i], i);
      },
    );
  }

  Widget _buildRow(String demoStr, int index) {
    return Material(
      child: ListTile(
        title: Text(
          demoStr,
          style: _biggerFont,
        ),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          setState(() {
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RandomWords()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExpansionTileSample()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListWithHeaders()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavigationDemo()),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabbedAppBarSample()),
                );
                break;
              case 5:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ButtonDesignDemo()),
                );
                break;
              case 6:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                break;
              case 7:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReturnDataFromSecondPage()),
                );
                break;

              case 8:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
                break;
            }
          });
        },
      ),
    );
  }
}
