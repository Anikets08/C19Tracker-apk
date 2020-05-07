import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'homescreen.dart';
class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    
    super.initState();
    Future.delayed(Duration(seconds: 3),
    (){
      Navigator.pushNamed(context, HomeScreen.id);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4160cc),
      body: Column(children: <Widget>[
        SizedBox(height: 80,),
        Center(child: Image.asset('lib/assets/assets1.png',height: 300,width: 300,)),
        Text("Covid-19 India Tracker",style:GoogleFonts.righteous(fontSize:  25,fontWeight: FontWeight.bold,color: Colors.white),),
        SizedBox(height: 50,),
        Text("Stay Home",style: GoogleFonts.staatliches(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
         Text("Stay Protected",style: GoogleFonts.staatliches(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
         SizedBox(height: 170,),
         Row(children: <Widget>[
           SizedBox(width: 110,),
           Icon(FontAwesomeIcons.twitter,size: 30,color: Colors.black,),
           Text("@aniketsingh08",style: GoogleFonts.roboto(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),

         ],)

      ],
      ),
    );
  }
}