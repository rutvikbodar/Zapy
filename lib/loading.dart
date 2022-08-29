import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
class  loading extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1b3238),
      child: Center(
        child: SpinKitSpinningLines(color: Colors.white,size: 50,),
      ),
    );
  }
}
