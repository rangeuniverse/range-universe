import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rangeuniverse/screens/home_screen.dart';

class AuthService {
  // Google Sign In
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        // You can now access the signed-in user using userCredential.user
        print('User signed in: ${userCredential.user!.displayName}');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        print('Google Sign-In canceled by user.');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }

  // Get user data
  Future<User?> getUserData() async {
    try {
      return FirebaseAuth.instance.currentUser;
    } catch (error) {
      print('Error getting user data: $error');
      return null;
    }
  }
}
