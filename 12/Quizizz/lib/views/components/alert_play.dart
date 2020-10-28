import 'package:flutter/material.dart';
import 'package:quiztest/views/play_screen/quiz_game.dart';
import 'package:quiztest/models/models.dart';

class PopUp extends StatelessWidget {
  PopUp(
      {
      this.imagePath,
      this.size,
      @required this.quiz,
      this.topic});

  final Quiz quiz;
  final String imagePath;
  final Size size;
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        height: size.height * 2 / 3,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Title(
              size: size,
              imagePath: "assets/images/solar.png",
              quiz: quiz,
            ),
            Buttons(
              size: size,
              quiz: quiz,
              topic: topic,
            ),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons(
      {Key key, @required this.size, this.quiz, this.topic})
      : super(key: key);

  final Size size;
  final Quiz quiz;
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizPage(
                                  quiz: quiz,
                                  topic: topic,
                                )));
                  },
                  padding: EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(30, 159, 107, 1),
                              Color.fromRGBO(29, 234, 151, 1)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Let's play!",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Image.asset("assets/icons/play-button.png")
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: ExitButton(),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: size.width * 2 / 5,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Challenge \nFriends",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Image.asset("assets/icons/friends.png")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title(
      {Key key,
      @required this.size,
      this.imagePath,
      this.quiz})
      : super(key: key);

  final Size size;
  final String imagePath;
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height * 1 / 4 + 10,
          child: Stack(children: [
            Container(
              height: size.height * 1 / 4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  quiz.numberOfQuestion.toString() + " Question",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            )
          ]),
        ),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              quiz.name,
              style: TextStyle(fontSize: 24, color: Colors.black),
            ))
      ],
    );
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.pop(context);
      },
      padding: EdgeInsets.all(0),
      child: Ink(
        child: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(180, 12, 12, 1),
                Color.fromRGBO(251, 15, 15, 1)
              ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
          child: Text(
            "Exit",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
