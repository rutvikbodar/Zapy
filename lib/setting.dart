import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zap/database.dart';
import 'package:zap/loading.dart';
import 'package:zap/user.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
late TextEditingController controller;
@override
  void initState() {
    // TODO: implement initState
    controller = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    final use = Provider.of<user?>(context);
    return StreamBuilder<DocumentSnapshot<Object?>>(
      stream: databaseservice(uid: use!.uid).playerdata,

      builder: (context, snapshot) {
        if(snapshot.hasData){
          DocumentSnapshot<Object?> playerdatasnap = snapshot.data!;
          void togglegender() async{
            String k = playerdatasnap.get("gender").toString();
            if(k=="m"){
              await databaseservice(uid: use.uid).updateplayerdata(playerdatasnap.get("username").toString(), "f");
            }
            else{
              await databaseservice(uid: use.uid).updateplayerdata(playerdatasnap.get("username").toString(), "m");
            }
          }

          Widget returngender(String s){
            if(s=="m"){
              return IconButton(onPressed: ()=>setState(() {
                togglegender();
              }),icon:Icon(Icons.male_outlined,color: Colors.white,size: 60,));
            }
            else{
              return IconButton(onPressed: ()=>setState(() {
                togglegender();
              }),icon:Icon(Icons.female_outlined,color: Colors.white,size: 60,));
            }
          }

          Future openDialog() => showDialog(context: context, builder: (context) => AlertDialog(
            title: Text("Username"),
            content: TextFormField(
              autofocus: true,
              controller: controller,
              decoration: InputDecoration(hintText: "Enter your Username"),
            ),
            actions: [
              TextButton(onPressed: () async {
                await databaseservice(uid: use.uid).updateplayerdata(controller.text, playerdatasnap.get("gender"));
                Navigator.of(context).pop();
              }, child: Text("Update"))
            ],
          ));

          Widget returnpicture(String s){
            if(s=="m"){
              return Image.asset('assets/images/male-modified.png');
            }
            else{
              return Image.asset('assets/images/female-modified.png');
            }
          }

          return MaterialApp(
            home: Scaffold(
              backgroundColor: Color(0xff1b3238),
              body: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(80),
                    margin: EdgeInsets.only(bottom: 180),
                    child: returnpicture(playerdatasnap.get("gender").toString())
                  ),

                  GestureDetector(
                    onLongPress: () => openDialog(),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 210),
                      child: Text(playerdatasnap.get("username").toString(),textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white,
                      ),),
                    ),
                  ),

                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: 130),
                    child: Container(
                        padding: EdgeInsets.only(right: 30),
                        child: returngender(playerdatasnap.get("gender").toString())
                    )
                  )
                ],
              ),

            ),
          );
        }
        else{
          return loading();
        }
      }
    );
  }
}
