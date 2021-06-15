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
}
