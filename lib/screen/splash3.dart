//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:aiwh_app/screen/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  /*@override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthScreen(),
                    ),
                  );
                }, // Updated onPressed handler

                child: const Text('Signup'),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Transform.scale(
                scale: 1,
                child: const Image(
                  width: double.infinity,
                  image: AssetImage('assets/Image/a3.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
              width: double.infinity,
              child: Text(
                'Manage anxiety',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Lexend',
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: const Color(0xff030303),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Container(
              // justastepawayS8m (1:3586)
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              width: double.infinity,
              child: Text(
                'Mindguard has crafted different resources carefully which will help you deal with your Anxiety and calm your mind.',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Lexend',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: const Color(0xff030303),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              // Adding the container with dots
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent, // Set the color to transparent
                      border: Border.all(
                        color: Colors.black,
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
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
