import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rangeuniverse/screens/game_screen.dart';
import 'package:rangeuniverse/services/auth_services.dart';

class HomeScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<User?>(
              future: authService.getUserData(),
              builder: (context, AsyncSnapshot<User?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(snapshot.data?.photoURL ?? ''),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Welcome, ${snapshot.data?.displayName ?? "User"}!',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    );
                  }
                }
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the game screen and pass information that the game has started
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(gameStarted: true),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                ),
                child: const Text(
                  'Play Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Archivo',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () => AuthService().signOutWithGoogle(context),
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
                      'Sign out with Google',
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
