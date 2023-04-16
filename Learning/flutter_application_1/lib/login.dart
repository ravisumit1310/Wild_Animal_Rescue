import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_application_1/send_data.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=> _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Material(
      child: Column(
        children: [Image.asset("assets/images/wlcmimg.png",fit: BoxFit.fill,),
        Text(
          "PFA Welcomes You",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Enter your Name',
        ),
      ),
       ElevatedButton(child: Text("Next"),
       style: TextButton.styleFrom(),
       onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SendPage()) );
       },
       ),
       SizedBox(height: 50),
       Text(
          "Dear sir/madam, Please enter you name here so that we can connect you for more details.",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal ,
          ),
        ),
        SizedBox(height: 50),
        Container(
          alignment: Alignment.center,
          child: Image.asset("assets/images/dogu.png",),
          height: 100,
        ),
        ]
      ,));
  }
}