import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatefulWidget {
  final List<int?> selectedAnswers;

  const Result({Key? key, required this.selectedAnswers}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int calculateTotalScore() {
    int totalScore = 0;
    for (int? answer in widget.selectedAnswers) {
      if (answer != null) {
        switch (answer) {
          case 1:
            totalScore += 4; // Very Likely
            break;
          case 2:
            totalScore += 3; // Somewhat Likely
            break;
          case 3:
            totalScore += 2; // Neutral
            break;
          case 4:
            totalScore += 1; // Not Good
            break;
          default:
            break;
        }
      } else {
        // If any question is unanswered, return -1 to indicate incomplete
        return -1;
      }
    }
    return totalScore;
  }

  double calculatePercentageScore() {
    int totalScore = calculateTotalScore();

    if (totalScore == -1) {
      return -1;
    }

    double adjustedPercentage = (totalScore / 40) * 100;

    return adjustedPercentage;
  }

  @override
  Widget build(BuildContext context) {
    double percentageScore = calculatePercentageScore();
    String scoreText = '';

    if (percentageScore != -1) {
      if (percentageScore <= 25) {
        scoreText =
            'It seems Your day have been quite bad. We suggest You to listen music and talk to someone. Our chat option is here for your help.';
      } else if (percentageScore <= 50) {
        scoreText =
            'It seems you had a less energetic day. We suggest you to read books and talk with out chat option.';
      } else if (percentageScore <= 75) {
        scoreText =
            'It seems Your day has been good today. still to make it more happy you can use our resources and therapy.';
      } else {
        scoreText =
            'Hurray! You seem very happy today. Hope You have a good day tomoroow as well!';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 1.15,
                child: const Image(
                  width: double.infinity,
                  image: AssetImage('assets/Image/emoji.png'),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Your Total Percentage Score is',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              percentageScore != -1
                  ? Column(
                      children: [
                        Text(
                          '${percentageScore.toStringAsFixed(2)}%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 63, 17, 177),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            scoreText,
                            style: GoogleFonts.getFont(
                              'Playfair Display',
                              color: const Color.fromRGBO(33, 150, 243, 1),
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                            /*style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),*/
                          ),
                        ),
                      ],
                    )
                  : Text(
                      'You have unanswered questions.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
