import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime_app/pages/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime_app/services/world_time.dart';

class LoadinScreen extends StatefulWidget {
  static const String id = 'loadingScreen';
  @override
  _LoadinScreenState createState() => _LoadinScreenState();
}

class _LoadinScreenState extends State<LoadinScreen> {

  void initState() {
    super.initState();
    setUpWorldTime();

  }

 // a method we grap data from so it take
 // so we have a loading time until we grap 
 //that data and push the second screen
  void setUpWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo');
    await instance.getTime();
    Navigator.pushReplacementNamed(
      context,
       Home.id , 
       //map of args 
      arguments: {
        //location is a property passsed
      'location' : instance.location ,
      'flag' : instance.flag ,
      'time' : instance.time ,
      'isDayTime' : instance.isDayTime,

      }  ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child:SpinKitFadingCube(
          color: Colors.yellow[800],
          size: 60.0,
        ) ,
      )),
    );
  }
}
