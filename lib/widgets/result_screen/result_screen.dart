import 'package:flutter/material.dart';
import 'package:quiz/configs/app_colors.dart';
import 'package:quiz/widgets/common/button.dart';
import 'package:quiz/widgets/game_screen/game_screen.dart';

class ResultScreen extends StatelessWidget {
  final int numberOfQuestions;
  final int numberOfCorrectAnswers;

  ResultScreen({@required this.numberOfCorrectAnswers, @required this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Card(
                margin: EdgeInsets.all(20),
                color: AppColors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Congratulations!',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                      ),
                    ),
                    Text(
                      'Your Score $numberOfCorrectAnswers / $numberOfQuestions',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                      buttonLabel: 'Main Menu',
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      }),
                  Button(
                      buttonLabel: 'Play Again',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameScreen(),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
