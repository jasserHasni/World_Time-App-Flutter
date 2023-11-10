import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:time_app/services/services.dart';
import 'dart:convert';    //responsible for json to decode the api into map that we can use
import 'package:flutter_spinkit/flutter_spinkit.dart';
class loading extends StatefulWidget {
   loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}
class _loadingState extends State<loading> {

  void SetupWorldTime() async {
    WorldTime instance = WorldTime(url: 'Africa/Tunis', location: 'Tunis', flag: 'kenya.png');
    await instance.gettime();     //await needs a Future<void>  in gettime() function and async in SetupWorldtime()
    Navigator.pushNamed(context,'/home',arguments: {
      'location' : instance.location , 'time' : instance.time ,'flag' : instance.flag, 'isdaytime' : instance.isdaytime
    });

  }
  @override
  void initState() {
    super.initState();
    SetupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.green,
      body : Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),

    );
  }
}
