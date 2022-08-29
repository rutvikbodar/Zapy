import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zap/setting.dart';
import 'package:zap/tothegame.dart';
import 'package:zap/user.dart';
import './DataBase.dart';
import './service.dart';
import 'package:provider/provider.dart';
import 'jointhegame.dart';
import 'loading.dart';
class home extends StatefulWidget{

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final Authservice _auth = Authservice();
  double h1 = 0;
  double h2 = 0;
  double o1 = 0;
  double o2 = 0;
  double o3 = 1;
  double o4 = 1;
  double x = 0;
  @override
  Widget build(BuildContext context) {
    final use = Provider.of<user?>(context);
    return  StreamBuilder<userData>(
      stream: databaseservice(uid : use!.uid).userdata,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          userData ud = snapshot.data!;
          return Scaffold(

              backgroundColor: Color(0xff1b3238),

              body: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.all(30),
                    child: IconButton(onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => setting()),
                    ); },
                        icon: Icon(Icons.settings,color: Colors.white,)),
                  ),

                  AnimatedOpacity(
                    opacity: o4,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        child: Text("Zapy", textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white, fontSize: 45,fontWeight: FontWeight.bold),
                        )
                    ),
                  ),

                  Center(
                    child: AnimatedOpacity(opacity: o4, duration: Duration(milliseconds: 500),
                    child: Icon(Icons.circle_outlined,color: Colors.white,size: 200,),
                    ),
                  ),



                  AnimatedContainer(duration: Duration(seconds: 1),
                    margin: EdgeInsets.only(top: h2),
                    padding: EdgeInsets.only(right: 68),
                    child: AnimatedOpacity(
                      opacity: o2,
                      duration: Duration(seconds: 2),
                        child: IconButton(icon: Icon(Icons.vpn_key_outlined,color: Colors.white,size: 100), onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => tothegame("Create the Game")),
                        ); },)
                    ),

                  ),
                  AnimatedContainer(duration: Duration(seconds: 1),
                    margin: EdgeInsets.only(top: h1),
                    padding: EdgeInsets.only(right: 68),
                    child: AnimatedOpacity(
                        opacity: o1,
                        duration: Duration(seconds: 2),
                        child: IconButton(icon: Icon(Icons.vpn_lock,size: 100,color: Colors.white,), onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => jointhegame("Join the Game")),
                        ); },)
                    ),

                  ),
                  GestureDetector(
                    onTap: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tothegame("Create the Game")),
                    ); },
                    child: Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.only(top: 260),
                      child: SizedBox(height: x,width: x,),
                    ),
                  ),
                  GestureDetector(
                    onTap: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tothegame("Join the Game")),
                    ); },
                    child: Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.only(top: 500),
                      child: SizedBox(height: x,width: x,),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(50),
                    alignment: Alignment.bottomRight,
                    child: AnimatedOpacity(
                      opacity: o3,
                      duration: Duration(milliseconds: 500),
                      child: FloatingActionButton(
                        onPressed: () => setState(() {
                          h1 = 250;
                          o1 = 1;
                          h2 = 500;
                          o2 = 1;
                          o3 = 0;
                          o4 = 0;
                          x=100;
                        }),
                        child: Icon(Icons.add,color: Colors.white
                          ,),
                      ),
                    ),
                  )
                ],

              )

          );
        }
        else{
          return loading();
        }
      }
    );
  }
}