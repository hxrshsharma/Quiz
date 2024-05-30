import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz.dart';

Quiz quizBrain = new Quiz();

void main() {
  runApp(Quizzie());
}

class Quizzie extends StatelessWidget {
  const Quizzie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("abc"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quizpage(),
          ),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  const Quizpage({super.key});

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  void End() {
    if (quizBrain.getIndex() + 1 >= Quiz().length) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Quiz Ended",
        desc: "Score : $scor",
        buttons: [
          DialogButton(
            child: Text(
              "Restart",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
              quizBrain.restrt();
              scor = 0;
              score.clear();
              Navigator.pop(context);
              });
              
            },
            color: Color.fromRGBO(0, 179, 134, 1.0),
          ),
        ],
      ).show();
    }
  }

  List<Widget> score = [];
  // List<String> question = [
  //   "can a cow  eat grass?",
  //   "Human have 206 bones ?",
  //   "A Slug\'s blood is green?"
  // ];
  // List<bool> answer = [true, false, true];
  int scor = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            "Score: $scor",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText().toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0))),
            child: Text(
              'True',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              bool? crctanswer = quizBrain.getAnswer();
              if (crctanswer == true) {
                score.add(Icon(
                  Icons.check,
                  color: Colors.green,
                ));
                scor++;
              } else {
                score.add(Icon(
                  Icons.close,
                  color: Colors.red,
                ));
              }
              setState(() {
                print(quizBrain.getIndex() + 1);
                print(Quiz().length);
                End();
                quizBrain.qnumber();
              });
            },
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
            ),
            child: Text(
              'False',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              bool? crctanswer = quizBrain.getAnswer();
              if (crctanswer == false) {
                score.add(Icon(
                  Icons.check,
                  color: Colors.green,
                ));
                scor++;
              } else {
                score.add(Icon(
                  Icons.close,
                  color: Colors.red,
                ));
              }
              setState(() {
                quizBrain.qnumber();
              });
            },
          ),
        )),
        Row(
          children: score,
        )
      ],
    );
  }
}
