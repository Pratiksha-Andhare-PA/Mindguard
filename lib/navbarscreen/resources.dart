import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:aiwh_app/navbarscreen/chat.dart';
import 'package:aiwh_app/navbarscreen/helpline.dart';
import 'package:aiwh_app/navbarscreen/home.dart';
import 'package:aiwh_app/widget/navbar_items.dart';
import 'package:aiwh_app/navbarscreen/assessment.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({Key? key}) : super(key: key);

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  final List<String> imagePaths = [
    'assets/Image/l1.jpg',
    'assets/Image/l2.jpg',
    'assets/Image/l3.jpg',
  ];

  final List<String> imageLinks = [
    'https://youtu.be/xMWtGozn5jU',
    'https://youtu.be/iKEhbRi7wKc',
    'https://youtu.be/IXSkixHIXo4',
    // Add corresponding links for each image
  ];

  int _currIdx = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resources'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int index = 0; index < imagePaths.length; index++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: GestureDetector(
                  onTap: () {
                    launchURL(imageLinks[index]);
                  },
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(15.0), // Circular border
                    child: Image.asset(
                      imagePaths[index],
                      width: double
                          .infinity, // You can adjust the width of the image
                    ),
                  ),
                ),
              ),
          ],
        ),
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
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(),
                ),
              );
              break;
            case 3:
              break;
            case 4:
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
        items: BottomNavigationItems.items,
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
