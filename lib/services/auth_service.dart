import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email'],
);

  Future<UserCredential?> signInWithGoogle() async {
  try {

    if (kIsWeb) {
      final googleProvider = GoogleAuthProvider();

      return await FirebaseAuth.instance.signInWithPopup(
        googleProvider,
      );
    }

    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn();

    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential =
        GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance
        .signInWithCredential(credential);

  } catch (e) {
    debugPrint("GOOGLE ERROR: $e");
    return null;
  }
}


  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}