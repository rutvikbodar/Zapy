
import 'package:flutter/material.dart';
import 'package:zap/register.dart';
import 'package:zap/signin.dart';
class auth extends StatefulWidget{
  authState createState() => authState();
}
class authState extends State<auth>{
  bool showsignin = true;
  void toggle(){
    setState(() {
      showsignin = !showsignin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showsignin){
      return signin(toggle : toggle);
    }
    else{
      return register(toggle : toggle);
    }
  }
}