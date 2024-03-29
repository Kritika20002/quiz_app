import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
        height: 300,
        child: SingleChildScrollView(
            child: Column(
                children: summaryData.map((data) {
              return SummaryItem(data);}
            ).toList(),

          )));
        }
  }

