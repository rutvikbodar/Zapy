import 'package:cloud_firestore/cloud_firestore.dart';
import './user.dart';
class databaseservice{
  final CollectionReference brewcollection = FirebaseFirestore.instance.collection('brews');
  final CollectionReference playerdatacollection = FirebaseFirestore.instance.collection('playerdata');
  final String? uid;
  databaseservice({this.uid});

  Future updateuserdata(int totalxp,int dailyxp,int streak) async{
    await brewcollection.doc(uid).set({
      "totalxp" : totalxp,
      "dailyxp" : dailyxp,
      "streak" : streak,
    });
  }

  Future updateplayerdata(String username, String gender) async{
    await playerdatacollection.doc(uid).set({
      "username" : username,
      "gender" : gender
    });
  }

  userData userfromsnap(DocumentSnapshot snapshot){
    return userData(
      uid : uid,
      totalxp : snapshot.get("totalxp"),
      dailyxp : snapshot.get("dailyxp"),
      streak : snapshot.get("streak"),
    );
  }
  Stream<userData> get userdata{
    return brewcollection.doc(uid).snapshots().map(userfromsnap);
  }
  Stream<DocumentSnapshot<Object?>> get playerdata{
    return playerdatacollection.doc(uid).snapshots();
  }
}
