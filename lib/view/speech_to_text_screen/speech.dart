/*
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
final speech = SpeechToText();
bool speechEnabled = false;
String textSpeech = '';
  @override
  void initState() {
    super.initState();
    initSpeech();
  }
  void initSpeech() async {
   speechEnabled= await speech.initialize();
   print('speech is enabled? ${speechEnabled}');
  }
  void startListening() async {
    if(speechEnabled){
      await speech.listen(onResult: (result) {
        setState(() {
          textSpeech = result.recognizedWords;
          print(result.recognizedWords);
        });
      });
    }
    else
      textSpeech = 'speech not enabled';
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Speech to Text'),
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            startListening();
          },
          child: speech.isListening? Icon(Icons.mic,color: Colors.white,) : Icon(Icons.mic_off_sharp,color: Colors.white,),
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Text(textSpeech,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
      ),)
    );
  }
}
*/
