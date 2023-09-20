import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz( this.switchScreen, {super.key});
  final void Function() switchScreen;

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  @override
  void initState() {
    super.initState();

    print("init");
  }
  @override
  Widget build(context) {
    print("build");
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset('assets/images/quiz-logo.png', width: 300, height: 300, color: const Color.fromARGB(135, 255, 255, 255),),
      const SizedBox(height: 40),
      SizedBox(
          height: 50,
          child: Text(
            "Learn Flutter the fun way !",
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 20),
          )),
      OutlinedButton.icon(
          onPressed: widget.switchScreen,
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20)),
          icon:const Icon(Icons.arrow_right_alt),
          label: const Text("Start Quiz"))
    ]));
  }
  @override
  void dispose() {

    super.dispose();

  }
}
