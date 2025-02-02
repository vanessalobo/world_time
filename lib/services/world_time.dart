import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

  String location; //location name for the UI
  String time; //time in that location
  String flag;// img url to an asset flag icon
  String url; //location url for api endpoint

  WorldTime({this.location, this.flag, this.url});
  Future<void> getTime() async{
try {
  //make the request
  Response response = await get('http://worldtimeapi.org/api/timezone/$url');
  Map data = jsonDecode(response.body);
  //print(data);

  //get properties from data

  String datetime = data['datetime'];
  String offset = data['utc_offset'].substring(1, 3);
  //print(datetime);
  // print(offset);

  //create a datetime object

  DateTime now = DateTime.parse(datetime);
  now = now.add(Duration(hours: int.parse(offset)));

  //set the time property
  time = now.toString();
}
catch(e)
    {
      print('Error - $e');
      time='could not load data';
    }


  }
}