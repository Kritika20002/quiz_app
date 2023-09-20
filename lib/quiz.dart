import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_quiz.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});


  @override
  State<Quiz> createState() {
    return _QuizState();
  }

}

class _QuizState extends State<Quiz> {
List<String> selectedAnswer =[];

void chosenAnswer(String answer) {
  selectedAnswer.add(answer);

  if(selectedAnswer.length == questions.length) {
    setState(() {
      //selectedAnswer =[];
      activeScreen='results-screen';
    });
  }
}
var activeScreen = 'start-screen';

void switchScreen() {
  setState((){
    activeScreen = 'question-screen';
  });
}
void onRestart() {
  setState(() {
    selectedAnswer=[];
    activeScreen='question-screen';
  });
}
  @override
  Widget build( context) {

  Widget activeWidget = StartQuiz(switchScreen);

  if(activeScreen == 'question-screen') {
    activeWidget = QuestionScreen(onSelectAnswer: chosenAnswer);
  }

  if(activeScreen == 'results-screen') {
    activeWidget = ResultScreen(chosenAnswers: selectedAnswer,onRestart: onRestart);
  }

  // if(activeScreen == 'start-screen') {
  //   activeWidget = StartQuiz(switchScreen);
  // }
      return MaterialApp(
          home:Scaffold(
            body: Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepPurple, Colors.purple], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: activeWidget,
            ),
          )
      );
  }

}