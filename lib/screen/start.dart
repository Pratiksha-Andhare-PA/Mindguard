import 'dart:async';
import 'package:flutter/material.dart';
import 'package:aiwh_app/screen/splash1.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen1()),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 1, 12, 37),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 55, 0, 0),
            child: const Center(
              child: Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Transform.scale(
            scale: 1.3,
            child: const Image(
              width: double.infinity,
              image: AssetImage('assets/Image/I1.png'),
            ),
          ),
          Container(
            // justastepawayS8m (1:3586)
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            width: double.infinity,
            child: Text(
              'Let\'s get started!',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Lexend',
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          /*Container(
            // Adding the container with dots
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent, // Set the color to transparent
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent, // Set the color to transparent
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
