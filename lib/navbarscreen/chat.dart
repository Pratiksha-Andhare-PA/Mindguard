import 'package:aiwh_app/navbarscreen/helpline.dart';
import 'package:aiwh_app/navbarscreen/home.dart';
import 'package:aiwh_app/navbarscreen/resources.dart';
import 'package:flutter/material.dart';
import 'package:aiwh_app/widget/navbar_items.dart';
import 'package:aiwh_app/navbarscreen/assessment.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _currIdx = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: const Center(
        child: Text('ChatBot'),
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
                Navigator.pushNamed(context, '/chat');
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
                Navigator.push(
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
