import 'package:aiwh_app/navbarscreen/chat.dart';
import 'package:aiwh_app/navbarscreen/helpline.dart';
import 'package:aiwh_app/navbarscreen/home.dart';
import 'package:aiwh_app/navbarscreen/resources.dart';
import 'package:flutter/material.dart';
import 'package:aiwh_app/widget/navbar_items.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aiwh_app/screen/quiz.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  int _currIdx = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Self Assessment',
          style: TextStyle(
            color: Color.fromARGB(255, 63, 17, 177),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 229, 154, 239),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1,
            child: const Image(
              width: double.infinity,
              image: AssetImage('assets/Image/a5.png'),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Text(
            'Let\'s explore your Emotions together!',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              'Playfair Display',
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              height: 1.5,
              color: const Color.fromARGB(255, 36, 17, 149),
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 60, // Adjust the width as needed
            height: 60, // Adjust the height as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 45, 152, 239), // Circle color
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuestionScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white, // Arrow icon color
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 63, 17, 177),
          currentIndex: _currIdx,
          onTap: (index) {
            setState(() {
              _currIdx = index;
            });
            switch (index) {
              case 0:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
                break;
              case 1:

                //Navigator.pushNamed(context, '/Assessment');
                break;
              case 2:
                // Navigate to Chat screen
                //Navigator.pushNamed(context, '/chat');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  ),
                );
                break;
              case 3:
                // Navigate to Resources screen
                //Navigator.pushNamed(context, '/resources');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResourcesScreen(),
                  ),
                );
                break;
              case 4:
                // Navigate to Helpline screen
                //Navigator.pushNamed(context, '/helpline');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpLineScreen(),
                  ),
                );
                break;
              default:
                break;
            }
          },
          items: BottomNavigationItems.items),
    );
  }
}
