import 'package:aiwh_app/navbarscreen/chat.dart';
import 'package:aiwh_app/navbarscreen/home.dart';
import 'package:aiwh_app/navbarscreen/resources.dart';
import 'package:flutter/material.dart';
import 'package:aiwh_app/widget/navbar_items.dart';
import 'package:aiwh_app/navbarscreen/assessment.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpLineScreen extends StatefulWidget {
  const HelpLineScreen({super.key});

  @override
  State<HelpLineScreen> createState() => _HelpLineScreenState();
}

class _HelpLineScreenState extends State<HelpLineScreen> {
  int _currIdx = 4;

  void _callHelpline() async {
    const helplineNumber = '+919820466726';
    final url = 'tel:$helplineNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HelpLine'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Talking about mental illness on Social Media is so\n',
                  style: GoogleFonts.getFont(
                    'Lexend',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: Color.fromARGB(255, 12, 1, 1),
                    decoration: TextDecoration.none,
                  ),
                ),
                TextSpan(
                  text: 'Attention Seeking',
                  style: GoogleFonts.getFont(
                    'Lexend',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: const Color(0xff030303),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                  text: '\nBRAVE & IMPORTANT',
                  style: GoogleFonts.getFont(
                    'Lexend',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Color.fromARGB(255, 24, 3, 161),
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            //margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Transform.scale(
              scale: 1,
              child: const Image(
                width: double.infinity,
                image: AssetImage('assets/Image/h2.png'),
              ),
            ),
          ),
          // Add some spacing between image and helpline
          GestureDetector(
            onTap: _callHelpline,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Call our Helpline: ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '+919820466726',
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 148, 10),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AssessmentScreen(),
                  ),
                );
                //Navigator.pushNamed(context, '/Assessment');
                break;
              case 2:
                // Navigate to Chat screen
                //Navigator.pushNamed(context, '/chat');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  ),
                );
                break;
              case 3:
                // Navigate to Resources screen
                //Navigator.pushNamed(context, '/resources');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResourcesScreen(),
                  ),
                );
                break;
              case 4:
                // Navigate to Helpline screen
                //Navigator.pushNamed(context, '/helpline');
                break;
              default:
                break;
            }
          },
          items: BottomNavigationItems.items),
    );
  }
}
