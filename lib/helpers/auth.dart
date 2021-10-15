//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:provider/provider.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return "Error";
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
