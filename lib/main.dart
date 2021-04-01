
import 'quiz_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
//        appBar:AppBar(
//          title:Text('Quizzler') ,
//          centerTitle:true ,
//        ) ,
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();

  void checkAdd(bool answerVal) {
    setState(() {
      bool correctAnswer = quizBrain.getAnswerVal();
 //     if (questionNumber < quizBrain.qaList.length - 1) {
        if (correctAnswer == answerVal) {
          quizBrain.getTrackerRow().add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          print('User\'s answer is rigt ');
        } else {
          quizBrain.getTrackerRow().add(Icon(Icons.close, color: Colors.red));
          print('user\'s answer is wrong');
        }
          quizBrain.nextQuestion(context);
        print('$answerVal Pressed');
//      } else {
//        if (correctAnswer == answerVal) {
//          marksRow.add(Icon(
//            Icons.check,
//            color: Colors.green,
//          ));
//          print('User\'s answer is rigt ');
//        } else {
//          marksRow.add(Icon(Icons.close, color: Colors.red));
//          print('user\'s answer is wrong');
//        }
//           Alert(context: context, title: "Finished !!", desc: "Quiz is Done.").show();
//
//        questionNumber = 0;
//        marksRow.clear();
//      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
                child: Text(
              quizBrain.getQuestionTxt(),
              style: TextStyle(fontSize: 24, color: Colors.white),
            )),
            flex: 5,
          ),
          Expanded(
              flex: 1,
              child: FlatButton(
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  checkAdd(true);
                },
              )),
          SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 1,
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  checkAdd(false);
                },
              )),
          Row(

            children: quizBrain.getTrackerRow(),
          ),
        ],
      ),
    ));
  }
}
