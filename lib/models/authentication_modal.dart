import 'package:flutter/material.dart';
import 'package:rangeuniverse/services/auth_services.dart';

class AuthenticationModal extends StatelessWidget {
  const AuthenticationModal({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 80,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () => AuthService().signInWithGoogle(context),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white,
                  side: const BorderSide(color: Colors.black12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Sign in with Google',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Archivo',
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
