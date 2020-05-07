import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'statescreen.dart';




class HomeScreen extends StatefulWidget {
   static const String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userData1;
  var userData2;
  var userData3;
  var userData4;

void getData()async{
    http.Response response = await http.get('https://disease.sh/v2/countries/india?yesterday=false&strict=false');
    if (response.statusCode == 200){
     String data = response.body;
    var casesData = jsonDecode(data)['cases'].toString();
    print(casesData);
    var deathsData = jsonDecode(data)['deaths'];
     print(deathsData);
    var recoveredData = jsonDecode(data)['recovered'];
     print(recoveredData);
    var activeData = jsonDecode(data)['active'];
     print(activeData);
    setState(() {
      userData1 = casesData;
      userData2 = deathsData;
      userData3 = recoveredData;
      userData4 = activeData;
    });

   } else{
     print(response.statusCode);
   }
  }


  
  @override
  void initState() {
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      return WillPopScope(
            onWillPop: () async => false,
              child: Scaffold(
                backgroundColor: Colors.black,
                body: SingleChildScrollView(
                                  child: Column(
                    
                    children: <Widget>[
                    Container(height: 100,width:MediaQuery.of(context).size.width,color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(child: Text("Covid-19 India Tracker",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                    ),),
                    SizedBox(height:80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      Container(
                        height: 200,
                        width: 150,
                        child: Column(children: <Widget>[
                          SizedBox(height:70),
                          Text("Active Cases",style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                          Text('${userData4 ?? "Loading"}',style: GoogleFonts.oswald(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),)
                    ]),
                    decoration: new BoxDecoration(
              color: Colors.redAccent,
              borderRadius: new BorderRadius.all(
                   const Radius.circular(40.0),
               ),
            ),
                  ), Container(
                    height: 200,
                    width: 150,
                    child: Column(children: <Widget>[
                          SizedBox(height:70),
                          Text("Total Cases",style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                          Text('${userData1 ?? "Loading"}',style: GoogleFonts.oswald(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),)
                    ]),
                    decoration: new BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: new BorderRadius.all(
                   const Radius.circular(40.0),
               ),
            ),
                  ),
              ],),
              SizedBox(height: 20,),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Container(
                    height: 200,
                    width: 150,
                    child: Column(children: <Widget>[
                          SizedBox(height:70),
                          Text("Deaths",style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                          Text('${userData2 ?? "Loading"}',style: GoogleFonts.oswald(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),)
                    ]),
                    decoration: new BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: new BorderRadius.all(
                   const Radius.circular(40.0),
               ),
            ),
                  ), Container(
                    height: 200,
                    width: 150,
                    child: Column(children: <Widget>[
                          SizedBox(height:70),
                          Text("Recovered",style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                          Text('${userData3 ?? "Loading"}',style: GoogleFonts.oswald(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),)
                    ]),
                    decoration: new BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: new BorderRadius.all(
                   const Radius.circular(40.0),
               ),
            ),
                  ),
              ],),
              SizedBox(height: 50),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, MyApp.id);},
                              child: Container(
                  child: Column(children: <Widget>[
                    SizedBox(height: 15,),
                     Text("State Wise Tracker",style: GoogleFonts.righteous(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                     Icon(FontAwesomeIcons.arrowCircleRight,color: Colors.white,size: 40,)
                    
                    ],),
                  width: 350,
                  height:100 ,
                  decoration: new BoxDecoration(
                color: Colors.orange,
                borderRadius: new BorderRadius.all(
                     const Radius.circular(40.0),
                 ),
            ),
                ),
              ),
              ],
            ),
                ),
      ),
    );
  }
}