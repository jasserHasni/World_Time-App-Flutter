import 'package:flutter/material.dart';
import 'pages/home.dart';    //or you can use import 'package:time_app/pages/home.dart'
import 'pages/loading.dart';
import 'pages/choose_location.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/loading',
  routes: {
    '/loading' : (context) => loading(),
    '/home' : (context) => Home(),
    '/choose_location' : (context) => choose()
  },


));

