import 'package:api_test/splash.dart';
import 'package:flutter/material.dart';
import 'package:api_test/fatch_data.dart';


void main()=> runApp( MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home:Splash(
      ),

    );
  }
}

