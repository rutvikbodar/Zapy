import 'package:zap/gamecreate.dart';
import 'package:zap/gamepage.dart';

import 'gamedatabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class tothegame extends StatefulWidget {
  tothegame(mode){
    this.mode = mode;
  }
  String mode = "null";
  @override
  _tothegameState createState() => _tothegameState();
}

class _tothegameState extends State<tothegame> {
  String code = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff1b3238),
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 240),
              child: Text(widget.mode,style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(top: 400),
              padding: EdgeInsets.all(20),
              child: OTPTextField(
                length: 5,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 55,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                otpFieldStyle: OtpFieldStyle(errorBorderColor: Colors.white,borderColor: Colors.white,disabledBorderColor: Colors.white,enabledBorderColor: Colors.white,focusBorderColor: Colors.white),
                style: TextStyle(fontSize: 17,color: Colors.white),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                  code = pin;
                },
              ),
            ),
            Container(
                child: FloatingActionButton(onPressed: () async {
                  gamedatabase? thegame = new gamedatabase(code: code);
                  thegame.updategamedata(
                    5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
                    5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
                    5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => gamepage(code)),
                  );
                },child: Icon(Icons.play_arrow_outlined,size: 40,),backgroundColor: Colors.green,),
              margin: EdgeInsets.only(top: 600),
            )
          ],
        ),
      ),
    );
  }
}
