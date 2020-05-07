import 'package:flutter/material.dart';
import 'modle.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  static const String id = 'MyApp';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String url =
      "https://covid-india-cases.herokuapp.com/states/";

  List<myModel> myAllData = [];

  @override
  void initState() {
    loadData();
  }

  loadData() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String responeBody = response.body;
      var jsonBody = json.decode(responeBody);
      for (var data in jsonBody) {
        myAllData.add(new myModel(
            data['cured'], data['deaths'], data['noOfCases'], data['state']));
      }
      setState(() {});
      
    } else {
      print('Something went wrong');
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
        home: new Scaffold(
          backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: Center(child: new Text('Statewise Cases')),
      ),
      body: myAllData.length == 0
          ? new Center(
              child: new CircularProgressIndicator(),
            )
          : showMyUI(),
    ));
  }

  Widget showMyUI() {
    return new ListView.builder(
        itemCount: myAllData.length,
        itemBuilder: (_, index) {
          return new Container(
            margin: new EdgeInsets.symmetric(vertical: 2.0,horizontal: 8.0),
            child: new Card(
              color: Colors.red,
              elevation: 10.0,
              child: new Container(
                padding: new EdgeInsets.all(12.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.symmetric(vertical: 3.0)),
                    new Text('State : ${myAllData[index].state}'),
                    new Padding(padding: new EdgeInsets.symmetric(vertical: 3.0)),
                    new Text('Number Of Cases : ${myAllData[index].noOfCases}'),
                    new Padding(padding: new EdgeInsets.symmetric(vertical: 3.0)),
                    new Text('Cured : ${myAllData[index].cured}'),
                    new Padding(padding: new EdgeInsets.symmetric(vertical: 3.0)),
                    new Text('Deaths : ${myAllData[index].deaths}'),
                    new Padding(padding: new EdgeInsets.symmetric(vertical: 3.0)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
