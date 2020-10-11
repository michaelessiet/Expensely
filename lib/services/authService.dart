import 'package:firebase_auth/firebase_auth.dart';
import 'package:Expensely/screens/authentication/user.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase object
  // ignore: cancel_subscriptions
  CurrentUser _userfromFirebase(User user) {
    return user != null ? CurrentUser(uid: user.uid) : null;
  }

  //auth change user stream i.e take user to app if he is logged in
  Stream<CurrentUser> get user {
    return _auth.authStateChanges().map(_userfromFirebase);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userfromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email

  //sign in with google

  //reg with email
}
