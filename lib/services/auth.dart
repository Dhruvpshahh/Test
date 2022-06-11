import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user object
  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      print('errrrrr');
      return null;
    }
    // try {
    //   UserCredential userCredential =
    //       await FirebaseAuth.instance.signInAnonymously();
    //   User user = userCredential.user!;
    //   return user;
    // } catch (e) {
    //   print(e.toString());
    //   return null;
    // }
  }
//sign in with email,pass

// register with email,pass

//signout
}
