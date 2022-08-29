
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './main.dart';
import './user.dart';
import './service.dart';
import 'auth.dart';
import 'home.dart';

class wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final use = Provider.of<user?>(context);
    print(use!=null ? use.uid : null);
    if(use==null){
      return auth();
    }
    else{
      return home();
    }
  }
}