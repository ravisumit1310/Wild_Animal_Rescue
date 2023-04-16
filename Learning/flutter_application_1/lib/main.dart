import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/send_data.dart';

void main() {
  runApp(MaterialApp(
    routes:{
      "/" : (context) => LoginPage(),
      "/send" : (context) => SendPage()
    },
  ));
}
