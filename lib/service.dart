
import 'package:firebase_auth/firebase_auth.dart';
import './user.dart';
import 'database.dart';
class Authservice{

  user? userfromfirebase(User? uuser){
    return uuser!= null ?
    user(uid : uuser.uid) : null;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<user?> get us{
    return _auth.authStateChanges().map((User? user) => userfromfirebase(user));
  }



  Future signinanon() async{
    try{
      User? user = (await FirebaseAuth.instance.signInAnonymously()).user;
      return user;
    }
    catch(e){
    print(e.toString());
    return null;
    }
  }

  Future signinwitheandp(String email,String password) async{
    try{
      User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
      return userfromfirebase(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerwitheandp(String email,String password) async{
    try{
      User? user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
      await databaseservice(uid : user!.uid).updateuserdata(0, 0, 0);
      await databaseservice(uid: user.uid).updateplayerdata("noobie", "m");
      return userfromfirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signout() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}