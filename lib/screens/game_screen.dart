import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rangeuniverse/utils/quizs.dart';

class GameScreen extends StatefulWidget {
  final bool gameStarted;

  const GameScreen({super.key, required this.gameStarted});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<int> correctAnswers; // Index of the correct answer

  int questionIndex = 0;
  int score = 0;
  late Timer _timer;
  int _timeLeft = 30;

  @override
  void initState() {
    super.initState();
    correctAnswers = List.generate(QuizUtils.questions.length,
        (index) => 0); // Generate correct answers list
    if (widget.gameStarted) {
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 50, // Adjust top position
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  score.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontFamily: "Archivo",
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      QuizUtils.questions[questionIndex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Archivo",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(
                    QuizUtils.choices[questionIndex].length,
                    (index) => SizedBox(
                      width: 300,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: ElevatedButton(
                          onPressed: () => checkAnswer(index),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            QuizUtils.choices[questionIndex][index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Archivo",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Time left: $_timeLeft seconds',
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Archivo",
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                width: 40, // Set width
                height: 40, // Set height
                decoration: const BoxDecoration(
                  color: Color(0xFF2563EB), // Set background color
                  shape: BoxShape.circle, // Make it round
                ),
                child: Center(
                  child: Text(
                    '${questionIndex + 1}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Archivo",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkAnswer(int selectedIndex) {
    _timer.cancel(); // Cancel the timer when the user answers
    if (selectedIndex == correctAnswers[questionIndex]) {
      setState(() {
        score += 100;
        if (questionIndex == QuizUtils.questions.length - 1) {
          // User answered all questions correctly
          showCongratulatoryModal();
        } else {
          questionIndex =
              min(questionIndex + 1, QuizUtils.questions.length - 1);
          startTimer(); // Start the timer for the next question
        }
      });
    } else {
      // Game over
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: const Color(0xFFDEEFFF), // Set background color
          title: const Text(
            'Game Over',
            style: TextStyle(fontFamily: "Archivo"),
          ),
          content: Text(
            'Your final score: $score',
            style: const TextStyle(
              fontFamily: "Archivo",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Pop the GameScreen route
              },
              child: const Text(
                'Play Again',
                style: TextStyle(
                  fontFamily: "Archivo",
                  color: Color(0xFF2563EB),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  void showCongratulatoryModal() {
    showDialog(
      barrierDismissible: false, // Prevent dismissing by tapping outside
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFFDEEFFF), // Set background color
        title: const Text(
          'Congratulations!',
          style: TextStyle(fontFamily: "Archivo"),
        ),
        content: Text(
          'You won the game with a score of $score',
          style: const TextStyle(
            fontFamily: "Archivo",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pop(); // Pop the GameScreen route
            },
            child: const Text(
              'Play Again',
              style: TextStyle(
                fontFamily: "Archivo",
                color: Color(0xFF2563EB),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void startTimer() {
    _timeLeft = 30; // Reset the timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          timer.cancel(); // Stop the timer when time is up
          showGameOverModal(); // Show game over modal
        }
      });
    });
  }

  void showGameOverModal() {
    showDialog(
      barrierDismissible: false, // Prevent dismissing by tapping outside
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFFDEEFFF), // Set background color
        title: const Text(
          'Game Over',
          style: TextStyle(fontFamily: "Archivo"),
        ),
        content: Text(
          'Time is up! Your final score: $score',
          style: const TextStyle(fontFamily: "Archivo"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pop(); // Pop the GameScreen route
            },
            child: const Text(
              'Play Again',
              style: TextStyle(
                fontFamily: "Archivo",
                color: Color(0xFF2563EB),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }
}
