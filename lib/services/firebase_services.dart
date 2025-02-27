import 'package:finence_tracker/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future createUser(UserModel user) async {
    try {
      // create a usercredictial in firebase.
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email.trim(),
        password: user.password.trim(),
      );

      // get user from userCredential
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        // update display name in firebaseuser
        await firebaseUser.updateDisplayName(user.name);
        await firebaseUser.reload();

        return {
          "status": "success",
          "message": "registeraion is successful",
          "id": firebaseUser.uid
        };
      }
    } on FirebaseAuthException catch (e) {
      return {
        "errorMessage": e.message,
        "status": "failed",
      };
    }
  }

  static Future loginUser(UserModel user) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: user.email, password: user.password);

      final User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        return {
          "status": "success",
          "message": "login successful",
          "name": user.name
        };
      }
    } on FirebaseAuthException catch (e) {
      return {
        "errorMessage": e.message,
        "status": "failed",
      };
    }
  }

  static Future logoutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
}
