
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zap/user.dart';
import 'package:zap/wrapper.dart';
import './auth.dart';
import './service.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(demoapp());
}

class demoapp extends StatefulWidget{
  demoappState createState() => demoappState();
}
class demoappState extends State<demoapp>{
  @override
  Widget build(BuildContext context) {
    return StreamProvider<user?>.value(
      value: Authservice().us,
      initialData: null,
      child: MaterialApp(
        home: wrapper(),
      ),
    );
  }
} 