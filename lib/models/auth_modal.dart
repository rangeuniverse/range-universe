import 'package:flutter/material.dart';
import 'package:rangeuniverse/services/auth_service.dart';

class AuthModal extends StatelessWidget {
  const AuthModal({super.key});

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
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () => AuthService().signInWithGoogle(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.hovered) ||
                          states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.selected)) {
                        return const Color(0xFFDEEFFF);
                      }
                      return const Color(0xFFFFFFFF);
                    },
                  ),
                  shadowColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
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
            ),
          ],
        ),
      ),
    );
  }
}
