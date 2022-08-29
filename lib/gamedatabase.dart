import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class gamedatabase{
  String? code = "NA";
  gamedatabase({this.code});

  final CollectionReference gameroomcollection = FirebaseFirestore.instance.collection('GameRoom');
  Future updategamedata(
      int x1y1,int x1y5,int x1y6,int x1y7,int x1y8,int x1y9,int x1y2, int x1y3, int x1y4,
      int x2y1,int x2y5,int x2y6,int x2y7,int x2y8,int x2y9,int x2y2, int x2y3, int x2y4,
      int x3y1,int x3y5,int x3y6,int x3y7,int x3y8,int x3y9,int x3y2, int x3y3, int x3y4,
      int x4y1,int x4y5,int x4y6,int x4y7,int x4y8,int x4y9,int x4y2, int x4y3, int x4y4,
      int x5y1,int x5y5,int x5y6,int x5y7,int x5y8,int x5y9,int x5y2, int x5y3, int x5y4,
      int x6y1,int x6y5,int x6y6,int x6y7,int x6y8,int x6y9,int x6y2, int x6y3, int x6y4,
      int x7y1,int x7y5,int x7y6,int x7y7,int x7y8,int x7y9,int x7y2, int x7y3, int x7y4,
      int x8y1,int x8y5,int x8y6,int x8y7,int x8y8,int x8y9,int x8y2, int x8y3, int x8y4,
      int x9y1,int x9y5,int x9y6,int x9y7,int x9y8,int x9y9,int x9y2, int x9y3, int x9y4,
      ) async{
    await gameroomcollection.doc(code).set({
      "x1y1" : x1y1,"x1y2":x1y2,"x1y3":x1y3,"x1y4":x1y4,"x1y5":x1y5,"x1y6":x1y6,"x1y7":x1y7,"x1y8":x1y8,"x1y9":x1y9,
      "x2y1" : x2y1,"x2y2":x2y2,"x2y3":x2y3,"x2y4":x2y4,"x2y5":x2y5,"x2y6":x2y6,"x2y7":x2y7,"x2y8":x2y8,"x2y9":x2y9,
      "x3y1" : x3y1,"x3y2":x3y2,"x3y3":x3y3,"x3y4":x3y4,"x3y5":x3y5,"x3y6":x3y6,"x3y7":x3y7,"x3y8":x1y8,"x3y9":x3y9,
      "x4y1" : x4y1,"x4y2":x4y2,"x4y3":x4y3,"x4y4":x4y4,"x4y5":x4y5,"x4y6":x4y6,"x4y7":x4y7,"x4y8":x4y8,"x4y9":x4y9,
      "x5y1" : x5y1,"x5y2":x5y2,"x5y3":x5y3,"x5y4":x5y4,"x5y5":x5y5,"x5y6":x5y6,"x5y7":x5y7,"x5y8":x5y8,"x5y9":x5y9,
      "x6y1" : x6y1,"x6y2":x6y2,"x6y3":x6y3,"x6y4":x6y4,"x6y5":x6y5,"x6y6":x6y6,"x6y7":x6y7,"x6y8":x6y8,"x6y9":x6y9,
      "x7y1" : x7y1,"x7y2":x7y2,"x7y3":x7y3,"x7y4":x7y4,"x7y5":x7y5,"x7y6":x7y6,"x7y7":x7y7,"x7y8":x7y8,"x7y9":x7y9,
      "x8y1" : x8y1,"x8y2":x8y2,"x8y3":x8y3,"x8y4":x8y4,"x8y5":x8y5,"x8y6":x8y6,"x8y7":x8y7,"x8y8":x8y8,"x8y9":x8y9,
      "x9y1" : x9y1,"x9y2":x9y2,"x9y3":x9y3,"x9y4":x9y4,"x9y5":x9y5,"x9y6":x9y6,"x9y7":x9y7,"x9y8":x9y8,"x9y9":x9y9,
      "shuffel" : 0,"m1" : 5,"m2" : 5,"m3" : 5,"m4":5,"m5":5,"m6":5,"m7":5,"m8":5,"m9" : 5,"player1" : "nil","player2" : "nil",
      "gender1" : "nil","gender2" : "nil"
    });
    print("game created Successfully");
  }

  Future mainprogress(String s,int r) async{
    if(s=="m1" && r==0){
      await gameroomcollection.doc(code).update({"x1y1":0,"x1y2":0,"x1y3":0,"x2y1":0,"x2y2":0,"x2y3":0,"x3y1":0,"x3y2":0,"x3y3":0},);
    }
    if(s=="m1" && r==1){
      await gameroomcollection.doc(code).update({"x1y1":1,"x1y2":1,"x1y3":1,"x2y1":1,"x2y2":1,"x2y3":1,"x3y1":1,"x3y2":1,"x3y3":1},);
    }
    if(s=="m2" && r==0){
      await gameroomcollection.doc(code).update({"x1y4":0,"x1y5":0,"x1y6":0,"x2y4":0,"x2y5":0,"x2y6":0,"x3y4":0,"x3y5":0,"x3y6":0},);
    }
    if(s=="m2" && r==1){
      await gameroomcollection.doc(code).update({"x1y4":1,"x1y5":1,"x1y6":1,"x2y4":1,"x2y5":1,"x2y6":1,"x3y4":1,"x3y5":1,"x3y6":1},);
    }
    if(s=="m3" && r==0){
      await gameroomcollection.doc(code).update({"x1y7":0,"x1y8":0,"x1y9":0,"x2y7":0,"x2y8":0,"x2y9":0,"x3y7":0,"x3y8":0,"x3y9":0},);
    }
    if(s=="m3" && r==1){
      await gameroomcollection.doc(code).update({"x1y7":1,"x1y8":1,"x1y9":1,"x2y7":1,"x2y8":1,"x2y9":1,"x3y7":1,"x3y8":1,"x3y9":1},);
    }
    if(s=="m4" && r==0){
      await gameroomcollection.doc(code).update({"x4y1":0,"x4y2":0,"x4y3":0,"x5y1":0,"x5y2":0,"x5y3":0,"x6y1":0,"x6y2":0,"x6y3":0},);
    }
    if(s=="m5" && r==0){
      await gameroomcollection.doc(code).update({"x4y4":0,"x4y5":0,"x4y6":0,"x5y4":0,"x5y5":0,"x5y6":0,"x6y4":0,"x6y5":0,"x6y6":0},);
    }
    if(s=="m6" && r==0){
      await gameroomcollection.doc(code).update({"x4y7":0,"x4y8":0,"x4y9":0,"x5y7":0,"x5y8":0,"x5y9":0,"x6y7":0,"x6y8":0,"x6y9":0},);
    }
    if(s=="m7" && r==0){
      await gameroomcollection.doc(code).update({"x7y1":0,"x7y2":0,"x7y3":0,"x8y1":0,"x8y2":0,"x8y3":0,"x9y1":0,"x9y2":0,"x9y3":0},);
    }
    if(s=="m8" && r==0){
      await gameroomcollection.doc(code).update({"x7y4":0,"x7y5":0,"x7y6":0,"x8y4":0,"x8y5":0,"x8y6":0,"x9y4":0,"x9y5":0,"x9y6":0},);
    }
    if(s=="m9" && r==0){
      await gameroomcollection.doc(code).update({"x7y7":0,"x7y8":0,"x7y9":0,"x8y7":0,"x8y8":0,"x8y9":0,"x9y7":0,"x9y8":0,"x9y9":0},);
    }
    if(s=="m4" && r==1){
      await gameroomcollection.doc(code).update({"x4y1":1,"x4y2":1,"x4y3":1,"x5y1":1,"x5y2":1,"x5y3":1,"x6y1":1,"x6y2":1,"x6y3":1},);
    }
    if(s=="m5" && r==1){
      await gameroomcollection.doc(code).update({"x4y4":1,"x4y5":1,"x4y6":1,"x5y4":1,"x5y5":1,"x5y6":1,"x6y4":1,"x6y5":1,"x6y6":1},);
    }
    if(s=="m6" && r==1){
      await gameroomcollection.doc(code).update({"x4y7":1,"x4y8":1,"x4y9":1,"x5y7":1,"x5y8":1,"x5y9":1,"x6y7":1,"x6y8":1,"x6y9":1},);
    }
    if(s=="m7" && r==1){
      await gameroomcollection.doc(code).update({"x7y1":1,"x7y2":1,"x7y3":1,"x8y1":1,"x8y2":1,"x8y3":1,"x9y1":1,"x9y2":1,"x9y3":1},);
    }
    if(s=="m8" && r==1){
      await gameroomcollection.doc(code).update({"x7y4":1,"x7y5":1,"x7y6":1,"x8y4":1,"x8y5":1,"x8y6":1,"x9y4":1,"x9y5":1,"x9y6":1},);
    }
    if(s=="m9" && r==1){
      await gameroomcollection.doc(code).update({"x7y7":1,"x7y8":1,"x7y9":1,"x8y7":1,"x8y8":1,"x8y9":1,"x9y7":1,"x9y8":1,"x9y9":1},);
    }

  }

  Future shuffelturn(int s) async{
    int r = 0;
    if(s==0){
      r=1;
    }
    if(s==1){
      r=0;
    }
    await gameroomcollection.doc(code).update({"shuffel" : r});
  }
  Future changegamedata(String k,int n) async{
    await gameroomcollection.doc(code).update({
      k: n
    });
  }
  Future changegameuserdata(String k,String n) async{
    await gameroomcollection.doc(code).update({
      k: n
    });
  }

  Stream<DocumentSnapshot<Object?>> get livegamedata{
    return gameroomcollection.doc(code).snapshots();
  }

}