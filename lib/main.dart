

import 'package:flutter/material.dart';
import 'package:worldtime_app/pages/choose_location.dart';
import 'package:worldtime_app/pages/home.dart';
import 'package:worldtime_app/pages/loading_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false ,
home: LoadinScreen(),
initialRoute: LoadinScreen.id ,

routes: {
  Home.id : (context) => 
  Home() ,
   LoadinScreen.id : (context) => LoadinScreen() ,
    LocationScreen.id : (context) => LocationScreen() ,
},



  ),
  );
}
