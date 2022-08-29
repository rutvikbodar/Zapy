import 'dart:core';

class user{
  String? uid = "s";
  user({this.uid});
}

class userData{
  final String? uid;
  final int? totalxp;
  final int? dailyxp;
  final int? streak;
  userData({this.uid,this.totalxp,this.dailyxp,this.streak});
}