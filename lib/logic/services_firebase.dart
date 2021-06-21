import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

//Stream<FirebaseAuth> get user => auth.userChanges();

class AuthService {
  //Create User
  Future<bool> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
      return userCredential.user != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //Login User

  Future<bool> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
      return userCredential.user != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //Logout

  Future<void> logout() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  ///Actualizar el Tipo de cambio
  ///
  ///
  Future<void> updateTC(String tc) {
    CollectionReference tcweb = FirebaseFirestore.instance.collection('tc');
    return tcweb
        .doc('tc')
        .update({'tc': tc})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Error"));
  }
}
