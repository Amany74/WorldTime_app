import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location ; // location name for ui
  String time ; // actual time in the location
  String flag ; //little image next to the location
  String url ; // url for api end point
  bool isDayTime = true ;
  WorldTime({this.location, this.flag, this.url});

//hold values until complete
  Future getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      //what we get back from the call response.body is a string that looks like an object
      // resonse body can be decoded to a map and then we can select a key from that map
      Map data = jsonDecode(response.body);

      ///get prop  from data
      String dateTime = await data['datetime'];
      String offset = await data['utc_offset'].substring(1, 3);

      //create date time object
      //convert dateTime into a date time objectn
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      //setting time property
      time = DateFormat.jm().format(now);

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print('ERROR :  $e');
      time = 'Error couldn\'t get time data ';
    }
  }
}
