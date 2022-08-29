
import 'package:flutter/material.dart';
import './service.dart';
import './loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
class register extends StatefulWidget {
  final Function? toggle;
  register({this.toggle});

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final Authservice _auth = Authservice();
  String email = '';
  String password = '';
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return load ? loading() : Scaffold(
        backgroundColor: Color(0xff1b3238),
        appBar: AppBar(
        backgroundColor: Color(0xff005c75),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 45, 15),
              child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.white,fontSize: 27,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            FlatButton.icon(onPressed: ()  {
              widget.toggle!();
            }, icon: Icon(Icons.person), label: Text("Sign in",style: TextStyle(color: Colors.white),)),

          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 50,horizontal: 50),
            child: Form(child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                TextFormField(
                  decoration: new InputDecoration.collapsed(hintText: "enter your email address",hintTextDirection: TextDirection.ltr,hintStyle: TextStyle(color: Colors.white)),
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },),
                SizedBox(height: 20),
                TextFormField(
                  decoration: new InputDecoration.collapsed(hintText: "enter your password",hintStyle: TextStyle(color: Colors.white)),
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },),
                SizedBox(height: 20,),
                FlatButton(
                  shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.red))
                  ),
                  color: Colors.yellow,
                  child: Text("Register",style: TextStyle(color: Colors.white),),
                  onPressed:() async{
                    setState(() {
                      load = true;
                    });
                    dynamic result = await _auth.registerwitheandp(email,password);
                    if(result==null){
                      print("user account createdccessfully");
                    }
                    else{
                      null;
                      setState(() {
                        load = true;
                      });
                    }
                  },

                )

              ],
            ))
        ));
  }
}
