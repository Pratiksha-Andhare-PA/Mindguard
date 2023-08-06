import 'package:aiwh_app/navbarscreen/assessment.dart';
import 'package:aiwh_app/navbarscreen/chat.dart';
import 'package:aiwh_app/navbarscreen/helpline.dart';
import 'package:aiwh_app/navbarscreen/resources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:aiwh_app/widget/navbar_items.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currIdx = 0;
  final List<String> imagePaths = [
    'assets/Image/I2.png',
    'assets/Image/b1.png',
    'assets/Image/b2.png',
    'assets/Image/b3.png',
  ];

  final List<String> imageLinks = [
    'https://videos.flaglerschools.com/media/May+Mental+Health+Minute+-+May+2%2C+2021/1_h12ibowm/179878191',
    // Add corresponding links for each image
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mindguard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Image/h1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: orientation == Orientation.portrait
                        ? const EdgeInsets.fromLTRB(0, 30, 0, 10)
                        : const EdgeInsets.fromLTRB(0, 10, 0,
                            10), // Adjust margins based on orientation
                    child: Column(
                      children: [
                        Text(
                          'Peace Begins with ',
                          style: GoogleFonts.getFont(
                            'Playfair Display',
                            color: Colors.white,
                            fontSize: orientation == Orientation.portrait
                                ? 37
                                : 30, // Adjust font size based on orientation
                          ),
                        ),
                        Text(
                          ' a Smile!',
                          style: GoogleFonts.getFont(
                            'Playfair Display',
                            color: Colors.white,
                            fontSize: orientation == Orientation.portrait
                                ? 37
                                : 30, // Adjust font size based on orientation
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: orientation == Orientation.portrait
                    ? 50
                    : 20, // Adjust position based on orientation
                left: 20,
                child: Container(
                  width: orientation == Orientation.portrait
                      ? 320
                      : 200, // Adjust width based on orientation
                  height: orientation == Orientation.portrait
                      ? 200
                      : 100, // Adjust height based on orientation
                  /*decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Image/I2.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.rectangle,
                  ),*/
                ),
              ),
              Positioned(
                bottom: 53,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  height: orientation == Orientation.portrait ? 200 : 100,
                  child: PageView.builder(
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          final url = imageLinks[index];
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Opacity(
                            opacity: 0.7,
                            child: Container(
                              width: orientation == Orientation.portrait
                                  ? 320
                                  : 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(imagePaths[index]),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
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

        /*items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Assessment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Helpline',
          ),
        ],*/
      ),
    );
  }
}
