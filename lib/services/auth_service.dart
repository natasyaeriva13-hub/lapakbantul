import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: kIsWeb
        ? "898421442078-b5sss0vjnbgn99sbs1p0sgdoavqlu9nv.apps.googleusercontent.com"
        : null,
    scopes: ['email'],
  );

  Future<UserCredential?> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser;

      if (kIsWeb) {
        // Coba silent sign-in dulu (kalau sudah pernah login)
        googleUser = await _googleSignIn.signInSilently();

        // Kalau belum pernah login, pakai requestScopes + signIn
        if (googleUser == null) {
          googleUser = await _googleSignIn.signIn();
        }
      } else {
        googleUser = await _googleSignIn.signIn();
      }

      if (googleUser == null) {
        debugPrint("GOOGLE ERROR: user cancelled");
        return null;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
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