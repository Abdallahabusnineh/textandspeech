import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:textandspeech/view/speech_to_text_screen/speech_to_text_screen.dart';

import '../text_to_speech/text_to_speech_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Get.to(SpeechToTextScreen());
              }, child: Text('Go to Speech To Text',style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Get.to
                  (TextToSpeechScreen());
              }, child: Text('Go to Text To Speech',style: TextStyle(color: Colors.white),),
            ),
        
        
          ],
        ),
      ),
    );
  }
}
