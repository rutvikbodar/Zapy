import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zap/database.dart';
import 'package:zap/gamedatabase.dart';
import 'package:zap/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zap/user.dart';

import 'determine.dart';
class gamepage extends StatefulWidget {
  String? code;
  gamepage(String code){
    this.code = code;
  }
  String username1 = 'nil';
  String gender1 = 'nil';
  String username2 = 'nil';
  String gender2 = 'nil';
  @override
  _gamepageState createState() => _gamepageState();
}
class _gamepageState extends State<gamepage> {
  dynamic giveicon(String k){
    if(k=='0'){
      return Icon(Icons.circle_outlined,color: Colors.white,);
    }
    if(k=='1'){
      return Icon(Icons.close,color: Colors.white,);
    }
    return Icon(Icons.mode,color: Color(0xff1b3238),);

  }


  dynamic giveboldicon(String k){
    if(k=='0'){
      return Icon(Icons.circle_outlined,color: Colors.white,size: 50,);
    }
    if(k=='1'){
      return Icon(Icons.close,color: Colors.white,size: 50,);
    }
    return Icon(Icons.mode,color: Color(0xff1b3238),);

  }

  Widget? bigmethod(Widget w,int r){
    if(r==0){
      print("circle here");
      return Container(
          padding: EdgeInsets.only(bottom: 120),
          child: Icon(Icons.circle_outlined,color: Colors.white,size: 80,)
      );
    }
    if(r==1){
      print("cross here");
      return Container(
          padding: EdgeInsets.only(bottom: 120),
          child: Icon(Icons.close,color: Colors.white,size: 80,)
      );
    }
    else {
      return w;
    }
  }

  Widget playerwidget(String s,String r){
    if(s=="nil"){
      return IconButton(onPressed: null, icon: Icon(Icons.event_seat_rounded,color: Colors.yellow,size: 80,));
    }
    else{
      return Row(
        children: [
          givedp(r),
          SizedBox(width: 20,),
          Text(s,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)
        ],
      );
    }
  }
  Widget player2widget(String s,String r){
    if(s=="nil"){
      return Container(
        width: double.infinity,
          margin: EdgeInsets.only(bottom: 20),
          child: IconButton(onPressed: null, icon: Icon(Icons.event_seat_rounded,color: Colors.yellow,size: 80,)));
    }
    else{
      return Row(
        children: [
          givedp(r),
          SizedBox(width: 20,),
          Text(s,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)
        ],
      );
    }
  }


  Widget givedp(String r){
    if(r=="m"){
      return Image.asset("assets/images/male-modified.png",height: 75,width: 75,);
    }
    else{
      return Image.asset("assets/images/female-modified.png",height: 75,width: 75,);
    }
  }
  Widget? biggermethod(Widget w,int r){
    if(r==0){
      print("circle here");
      return Center(
        child: Container(
            padding: EdgeInsets.only(bottom: 120),
            child: Icon(Icons.circle_outlined,color: Colors.white,size: 300,)
        ),
      );
    }
    if(r==1){
      print("cross here");
      return Container(
          padding: EdgeInsets.only(bottom: 120),
          child: Icon(Icons.close,color: Colors.white,size: 300,)
      );
    }
    else {
      return w;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Object?>>(
      stream: gamedatabase(code: widget.code).livegamedata,
      builder: (context, snapshot) {
        DocumentSnapshot<Object?>? gamedata = snapshot.data;
        if(snapshot.hasData){
          print("retrived the data");
          print(widget.code);
          int m1=5;
          int m2=5;
          int m3=5;
          int m4=5;
          int m5 =5;
          int m6 = 5;
          int m7 = 5;
          int m8 = 5;
          int m9 = 5;
          int mfinal = 5;

          Future pop() async{
            m1 = determine(x1y1: gamedata!.get("x1y1"),x1y2: gamedata.get("x1y2"),x1y3: gamedata.get("x1y3"),x2y1: gamedata.get("x2y1"),x2y2: gamedata.get("x2y2"),
            x2y3: gamedata.get("x2y3"),x3y1: gamedata.get("x3y1"),x3y2: gamedata.get("x3y2"),x3y3: gamedata.get("x3y3")).result!;
            m2 = determine(x1y1: gamedata.get("x1y4"),x1y2: gamedata.get("x1y5"),x1y3: gamedata.get("x1y6"),x2y1: gamedata.get("x2y4"),x2y2: gamedata.get("x2y5"),
                x2y3: gamedata.get("x2y6"),x3y1: gamedata.get("x3y4"),x3y2: gamedata.get("x3y5"),x3y3: gamedata.get("x3y6")).result!;
            m3 = determine(x1y1: gamedata.get("x1y7"),x1y2: gamedata.get("x1y8"),x1y3: gamedata.get("x1y9"),x2y1: gamedata.get("x2y7"),x2y2: gamedata.get("x2y8"),
                x2y3: gamedata.get("x2y9"
                    ""),x3y1: gamedata.get("x3y7"),x3y2: gamedata.get("x3y8"),x3y3: gamedata.get("x3y9")).result!;
          m4 = determine(x1y1: gamedata.get("x4y1"),x1y2: gamedata.get("x4y2"),x1y3: gamedata.get("x4y3"),x2y1: gamedata.get("x5y1"),x2y2: gamedata.get("x5y2"),
              x2y3: gamedata.get("x5y3"),x3y1: gamedata.get("x6y1"),x3y2: gamedata.get("x6y2"),x3y3: gamedata.get("x6y3")).result!;
          m5 = determine(x1y1: gamedata.get("x4y4"),x1y2: gamedata.get("x4y5"),x1y3: gamedata.get("x4y6"),x2y1: gamedata.get("x5y4"),x2y2: gamedata.get("x5y5"),
              x2y3: gamedata.get("x5y6"),x3y1: gamedata.get("x6y4"),x3y2: gamedata.get("x6y5"),x3y3: gamedata.get("x6y6")).result!;
          m6 = determine(x1y1: gamedata.get("x4y7"),x1y2: gamedata.get("x4y8"),x1y3: gamedata.get("x4y9"),x2y1: gamedata.get("x5y7"),x2y2: gamedata.get("x5y8"),
              x2y3: gamedata.get("x5y9"),x3y1: gamedata.get("x6y7"),x3y2: gamedata.get("x6y8"),x3y3: gamedata.get("x6y9")).result!;
          m7 = determine(x1y1: gamedata.get("x7y1"),x1y2: gamedata.get("x7y2"),x1y3: gamedata.get("x7y3"),x2y1: gamedata.get("x8y1"),x2y2: gamedata.get("x8y2"),
              x2y3: gamedata.get("x8y3"),x3y1: gamedata.get("x9y1"),x3y2: gamedata.get("x9y2"),x3y3: gamedata.get("x9y3")).result!;
          m8 = determine(x1y1: gamedata.get("x7y4"),x1y2: gamedata.get("x7y5"),x1y3: gamedata.get("x7y6"),x2y1: gamedata.get("x8y4"),x2y2: gamedata.get("x8y5"),
              x2y3: gamedata.get("x8y6"),x3y1: gamedata.get("x9y4"),x3y2: gamedata.get("x9y5"),x3y3: gamedata.get("x9y6")).result!;
          m9 = determine(x1y1: gamedata.get("x7y7"),x1y2: gamedata.get("x7y8"),x1y3: gamedata.get("x7y9"),x2y1: gamedata.get("x8y7"),x2y2: gamedata.get("x8y8"),
              x2y3: gamedata.get("x8y9"),x3y1: gamedata.get("x9y7"),x3y2: gamedata.get("x9y8"),x3y3: gamedata.get("x9y9")).result!;
          mfinal = determine(x1y1: m1,x1y2: m2,x1y3: m3,x2y1: m4,x2y2: m5,x2y3: m6,x3y1: m7,x3y2: m8,x3y3: m9).result!;


          print("m1 : "+m1.toString());
          print("m2 : "+m2.toString());
          print("m3 : "+m3.toString());
          print("m9 : "+m9.toString());
          }
          pop();
          gamedatabase(code: widget.code).mainprogress("m1",m1);
          gamedatabase(code: widget.code).mainprogress("m1",m1);
          gamedatabase(code: widget.code).mainprogress("m2",m2);
          gamedatabase(code: widget.code).mainprogress("m3",m3);
          gamedatabase(code: widget.code).mainprogress("m4",m4);
          gamedatabase(code: widget.code).mainprogress("m5",m5);
          gamedatabase(code: widget.code).mainprogress("m6",m6);
          gamedatabase(code: widget.code).mainprogress("m7",m7);
          gamedatabase(code: widget.code).mainprogress("m8",m8);
          gamedatabase(code: widget.code).mainprogress("m9",m9);


          int turn = gamedata!.get("shuffel");
          void popagain(){
            setState(() {
              pop();
            });
          }
          void changeturn() async{
            await pop();
            gamedatabase(code: widget.code).shuffelturn(turn);
            popagain();
          }
          List<Widget> list = <Widget>[
            Table(///////////1
              border: TableBorder.all(color: Colors.white,width: 2),
              defaultColumnWidth: FlexColumnWidth(2.0),
              children: [
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x1y1").toString()),
                      onTap: () {
                        print("1,1");
                        gamedatabase(code: widget.code).changegamedata("x1y1", turn);
                        popagain();
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x1y2").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x1y2", turn);
                        popagain();
                        changeturn();
                      }
                  ),

                  GestureDetector(
                      child : giveicon(gamedata.get("x1y3").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x1y3", turn);
                        popagain();
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x2y1").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x2y1", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x2y2").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x2y2", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x2y3").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x2y3", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x3y1").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x3y1", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x3y2").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x3y2", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x3y3").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x3y3", turn);
                        changeturn();
                      }
                  ),
                ])
              ],
            ),


            Table(/////////////////////2
              border: TableBorder.all(color: Colors.white,width: 2),
              defaultColumnWidth: FlexColumnWidth(2.0),
              children: [
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x1y4").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x1y4", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x1y5").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x1y5", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x1y6").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x1y6", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x2y4").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x2y4", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x2y5").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x2y5", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x2y6").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x2y6", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x3y4").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x3y4", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x3y5").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x3y5", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x3y6").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x3y6", turn);
                        changeturn();
                      }
                  ),
                ])
              ],
            ),


            Table(////////////////3
              border: TableBorder.all(color: Colors.white,width: 2),
              defaultColumnWidth: FlexColumnWidth(2.0),
              children: [
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x1y7").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x1y7", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x1y8").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x1y8", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x1y9").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x1y9", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x2y7").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x2y7", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x2y8").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x2y8", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x2y9").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x2y9", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x3y7").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x3y7", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x3y8").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x3y8", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x3y9").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x3y9", turn);
                        changeturn();
                      }
                  ),
                ])
              ],
            ),



            Table(//////////////4
              border: TableBorder.all(color: Colors.white,width: 2),
              defaultColumnWidth: FlexColumnWidth(2.0),
              children: [
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x4y1").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x4y1", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x4y2").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x4y2", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x4y3").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x4y3", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x5y1").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x5y1", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x5y2").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x5y2", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x5y3").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x5y3", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x6y1").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x6y1", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x6y2").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x6y2", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x6y3").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x6y3", turn);
                        changeturn();
                      }
                  ),
                ])
              ],
            ),



            Table(////////////5
              border: TableBorder.all(color: Colors.white,width: 2),
              defaultColumnWidth: FlexColumnWidth(2.0),
              children: [
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x4y4").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x4y4", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x4y5").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x4y5", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x4y6").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x4y6", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x5y4").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x5y4", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x5y5").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x5y5", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x5y6").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x5y6", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x6y4").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x6y4", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x6y5").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x6y5", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x6y6").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x6y6", turn);
                        changeturn();
                      }
                  ),
                ])
              ],
            ),


            Table(/////////6
              border: TableBorder.all(color: Colors.white,width: 2),
              defaultColumnWidth: FlexColumnWidth(2.0),
              children: [
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x4y7").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x4y7", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x4y8").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x4y8", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x4y9").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x4y9", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x5y7").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x5y7", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x5y8").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x5y8", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x5y9").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x5y9", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x6y7").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x6y7", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x6y8").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x6y8", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x6y9").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x6y9", turn);
                        changeturn();
                      }
                  ),
                ])
              ],
            ),


            Table(///////////7
              border: TableBorder.all(color: Colors.white,width: 2),
              defaultColumnWidth: FlexColumnWidth(2.0),
              children: [
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x7y1").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x7y1", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x7y2").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x7y2", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x7y3").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x7y3", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x8y1").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x8y1", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x8y2").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x8y2", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x8y3").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x8y3", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x9y1").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x9y1", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x9y2").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x9y2", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x9y3").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x9y3", turn);
                        changeturn();
                      }
                  ),
                ])
              ],
            ),



            Table(/////8
              border: TableBorder.all(color: Colors.white,width: 2),
              defaultColumnWidth: FlexColumnWidth(2.0),
              children: [
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x7y4").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x7y4", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x7y5").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x7y5", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x7y6").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x7y6", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x8y4").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x8y4", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x8y5").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x8y5", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x8y6").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x8y6", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x9y4").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x9y4", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x9y5").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x9y5", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x9y6").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x9y6", turn);
                        changeturn();
                      }
                  ),
                ])
              ],
            ),



            Table(/////9
              border: TableBorder.all(color: Colors.white,width: 2),
              defaultColumnWidth: FlexColumnWidth(2.0),
              children: [
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x7y7").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x7y7", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x7y8").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x7y8", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x7y9").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x7y9", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x8y7").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x8y7", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x8y8").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x8y8", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x8y9").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x8y9", turn);
                        changeturn();
                      }
                  ),
                ]),
                TableRow(children: <Widget>[
                  GestureDetector(
                      child : giveicon(gamedata.get("x9y7").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x9y7", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x9y8").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x9y8", turn);
                        changeturn();
                      }
                  ),
                  GestureDetector(
                      child : giveicon(gamedata.get("x9y9").toString()),
                      onTap: () {
                        print("2,2");
                        gamedatabase(code: widget.code).changegamedata("x9y9", turn);
                        changeturn();
                      }
                  ),
                ])
              ],
            ),





          ];

          Widget rs = Center(
            child: Stack(alignment: Alignment.center,children: <Widget>[

              Container(
                margin: EdgeInsets.only(bottom: 120),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),
                child: SizedBox(
                  height: 320,
                  width: 350,
                ),
              ),

              Container(//1
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 200,left: 50),
                child: SizedBox(
                    height: 200,
                    width: 80,
                    child:  bigmethod(list[0], m1)
                ),
              ),
              Container(//2
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 200),
                child: SizedBox(
                    height: 200,
                    width: 80,
                    child:  bigmethod(list[1], m2)
                ),
              ),
              Container(//3
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(top: 200,right: 50),
                child: SizedBox(
                    height: 200,
                    width: 80,
                    child:  bigmethod(list[2], m3)
                ),
              ),
              Container(//4
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(50),
                child: SizedBox(
                    height: 200,
                    width: 80,
                    child:  bigmethod(list[3], m4)
                ),
              ),
              Center(//5
                child: Container(
                  child: SizedBox(
                      height: 200,
                      width: 80,
                      child:  bigmethod(list[4], m5)
                  ),
                ),
              ),

              Container(//6
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(50),
                child: SizedBox(
                    height: 200,
                    width: 80,
                    child:  bigmethod(list[5], m6)
                ),
              ),

              Container(//7
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(bottom: 200,left: 50),
                child: SizedBox(
                    height: 200,
                    width: 80,
                    child:  bigmethod(list[6], m7)
                ),
              ),
              Container(//8
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 200),
                child: SizedBox(
                    height: 200,
                    width: 80,
                    child:  bigmethod(list[7], m8)
                ),
              ),



              Container(//9
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(bottom: 200,right: 50),
                child: SizedBox(
                    height: 200,
                    width: 80,
                    child:  bigmethod(list[8], m9)
                ),
              ),



            ],),
          );

          final use = Provider.of<user?>(context);
          return StreamBuilder<DocumentSnapshot<Object?>>(
            stream: databaseservice(uid: use!.uid).playerdata,
            builder: (context, snapshot) {
              DocumentSnapshot<Object?> playersnap = snapshot.data!;

                widget.username1 = gamedata.get("player1").toString();
                widget.gender1 = gamedata.get("gender1").toString();
                widget.username2 = gamedata.get("player2").toString();
                widget.gender2 = gamedata.get("gender2").toString();


              return MaterialApp(
                home: Scaffold(
                  backgroundColor: Color(0xff1b3238),
                  body: Stack(
                    children: <Widget>[
                    Container(
                        child: biggermethod(rs, mfinal)
                    ),

                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top : 520),
                            child: giveboldicon(gamedata.get("shuffel").toString()),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 380,left: 50),
                            child: SizedBox(
                                height: 80,
                                width: 200,
                                child: playerwidget(widget.username1, widget.gender1)
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(top: 680,right: 50),
                            child: SizedBox(
                              height: 80,
                              width: 200,
                              child: player2widget(widget.username2, widget.gender2),
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onLongPress: () {
                          setState(() async {
                            await gamedatabase(code: widget.code).changegameuserdata("player1", playersnap.get("username").toString());
                            await gamedatabase(code: widget.code).changegameuserdata("gender1", playersnap.get("gender").toString());
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.only(top: 560,left: 110),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                          ),

                        ),
                      ),

                      GestureDetector(
                        onLongPress: () {
                          setState(() async {
                            await gamedatabase(code: widget.code).changegameuserdata("player2", playersnap.get("username").toString());
                            await gamedatabase(code: widget.code).changegameuserdata("gender2", playersnap.get("gender").toString());
                          });

                        },
                        child: Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.only(top: 706,left: 240),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                          ),

                        ),
                      ),

                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: 80),
                        child: Text("Code : "+widget.code.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.greenAccent),),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(top: 40,right: 20),
                        child: IconButton(onPressed: () async {
                          gamedatabase? thegame = new gamedatabase(code: widget.code);
                          thegame.updategamedata(
                              5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
                              5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
                              5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
                          );

                        }, icon: Icon(Icons.restart_alt_outlined,color: Colors.redAccent,)),
                      )
                    ]
                  ),
                ),
              );
            }
          );
        }
        else{
          return loading();
        }
      }
    );
  }
}
