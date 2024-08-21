import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:textandspeech/view/home/home_Screen.dart';
import 'package:textandspeech/view/speech_to_text_screen/speech.dart';
import 'package:textandspeech/view/speech_to_text_screen/speech_to_text_screen.dart';
import 'package:textandspeech/view/text_to_speech/text_to_speech_screen.dart';

void main() {
  runApp(
     const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  HomeScreen(),
    );
  }
}
