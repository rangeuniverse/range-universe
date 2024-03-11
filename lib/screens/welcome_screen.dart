import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rangeuniverse/utils/assets.dart';
import 'package:rangeuniverse/models/auth_modal.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _launchURL() async {
    const url = 'https://www.rangeuniverse.org';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.globalization),
              const SizedBox(height: 20),
              Container(
                constraints: const BoxConstraints(maxWidth: 290),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: "Archivo",
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Tech',
                        style: TextStyle(color: Color(0xFF2563EB)),
                      ),
                      TextSpan(
                        text: ' is the ',
                      ),
                      TextSpan(
                        text: 'Future ',
                        style: TextStyle(color: Color(0xFF2563EB)),
                      ),
                      TextSpan(
                        text: ' & the ',
                      ),
                      TextSpan(
                        text: 'Future',
                      ),
                      TextSpan(
                        text: ' is Now',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'We enable people to excel in tech, whether through learning digital skills or building digital products that make our lives easier and better.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Archivo",
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const AuthModal();
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Archivo',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _launchURL();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDEEFFF),
                    // side: const BorderSide(color: Colors.black12),
                  ),
                  child: const Text(
                    'Visit Website',
                    style: TextStyle(
                      color: Color(0xFF2563EB),
                      fontFamily: 'Archivo',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
