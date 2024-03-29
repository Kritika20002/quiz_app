import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});
  final Map<String,Object> itemData;

  @override
  Widget build(context) {
   final isCorrectAnswer = itemData['user_answer'] == itemData['correct_answer'];
   return Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10), child:Row(
     crossAxisAlignment: CrossAxisAlignment.start,
     children :[
       QuestionIdentifier(isCorrectAnswer: isCorrectAnswer,
           questionIndex: itemData['question_index'] as int),
       const SizedBox(width: 20),
        Expanded(child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
           children: [
                 Text(itemData['question'] as String,
                     style: GoogleFonts.roboto(color: Colors.white, fontSize: 15),
                     textAlign: TextAlign.left),
                 const SizedBox(height: 5),
                 Text(itemData['user_answer'] as String,
                     style: GoogleFonts.roboto(
                         color: const Color.fromARGB(255, 72, 14, 82),
                         fontSize: 13,
                         fontWeight: FontWeight.bold),
                     textAlign: TextAlign.left),
                 Text(
                   itemData['correct_answer'] as String,
                   style: GoogleFonts.roboto(
                       color: Colors.green,
                       fontSize: 13,
                       fontWeight: FontWeight.bold),
                   textAlign: TextAlign.left,
                 )
               ]))
      ] ));
  }

}