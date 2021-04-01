import 'questions_answers_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

class QuizBrain{
  //Questions & Answers List
  int _questionNumber = 0;
  List<QA_Bank> _qaList =[
    QA_Bank('Some cats are actually allergic to humans', true),
    QA_Bank('You can lead a cow down stairs but not up stairs.', false),
    QA_Bank('Approximately one quarter of human bones are in the feet.', true),
    QA_Bank('A slug\'s blood is green.', true),
    QA_Bank('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    QA_Bank('It is illegal to pee in the Ocean in Portugal.', true),
    QA_Bank(
        'No piece of square dry paper can be folded in half more than 7 times.', false),
    QA_Bank(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
  QA_Bank(
      'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
  QA_Bank(
      'The total surface area of two human lungs is approximately 70 square metres.',
      true),
  QA_Bank('Google was originally called \"Backrub\".', true),
  QA_Bank(
      'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',true),
  QA_Bank(
      'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
  QA_Bank(' blood is red.', true),
  QA_Bank('Nile River is the tallest River in the world', false),
  ];

  List<Icon> _marksRow = [];

   List getTrackerRow(){
  return _marksRow;
   }
   String getQuestionTxt(){
     return _qaList[_questionNumber].question;
   }

    bool getAnswerVal(){
     return _qaList[_questionNumber].answer;
    }

  void  nextQuestion(context){
     if(_questionNumber < _qaList.length-1){
       _questionNumber++;
     }else{
       Alert(context: context, title: "Finished !!", desc: "Quiz is Done.",).show();
       _questionNumber = 0;
       _marksRow.clear();
     }

  }
}

 //  \\ Another Alert
//         Alert(
//          context: context,
//          type: AlertType.error,
//          title: "Finished !!",
//          desc: "Quiz is Done...",
//          buttons: [
//            DialogButton(
//              child: Text(
//                "OK",
//                style: TextStyle(color: Colors.white, fontSize: 20),
//              ),
//              onPressed: () => Navigator.pop(context),
//           width: 120,
//            )
//          ],
//        ).show();