import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isdaytime;

  WorldTime({required this.location ,required this.flag ,required this.url})  {}     //class that get url , flag , loaction of a country/city
  Future<void> gettime() async {
  try {
    Uri uri = Uri.parse('https://worldtimeapi.org/api/timezone/$url'); //convert string to type uri
    Response response = await get(uri);
    Map data = jsonDecode(response.body); //response.body is string type
    String y = data["utc_offset"].substring(1, 3); //substract hours to add
    int x = int.parse(y);
    DateTime now = DateTime.parse(data["datetime"]); // convert string from api to datetime type
    now.add(Duration(hours: x)); //add hours to datetime
    time = DateFormat.jm().format(now);
    isdaytime = now.hour > 6 && now.hour < 20 ? true : false;
  }
  catch(e) {
    print('failed to get time');
    time='error getting time';
  }

  }

  }







