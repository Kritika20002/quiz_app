import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/quiz.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAnswers, required this.onRestart});
  List<String> chosenAnswers;
  final void Function () onRestart;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(60),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  style: GoogleFonts.roboto(fontSize: 25, color: Colors.purpleAccent), textAlign: TextAlign.center),
              const SizedBox(height: 30),
              QuestionSummary(getSummaryData()),
              const SizedBox(height: 30),
              TextButton.icon(onPressed: onRestart, icon: const Icon(Icons.refresh_outlined),
              label: const Text('Restart Quiz'), style: TextButton.styleFrom(
                  foregroundColor: Colors.white
                ),)
            ])));
  }

  void onClick() {
    chosenAnswers =[];
    //activeScreen='start-screen';
  }
}
