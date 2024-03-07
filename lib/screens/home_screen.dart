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
            FutureBuilder(
              future: authService.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Column(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          // backgroundImage: NetworkImage(snapshot.data!),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Welcome, ${snapshot.data?.displayName}!',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    );
                  }
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the game screen and pass information that the game has started
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameScreen(gameStarted: true),
                  ),
                );
              },
              child: const Text('Play Now'),
            ),
          ],
        ),
      ),
    );
  }
}
