import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textandspeech/controller/speech_to_text_controller/speech_to_text_controller.dart';

class SpeechToTextScreen extends StatelessWidget {
  const SpeechToTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpeechToTextController>(
      init: SpeechToTextController(),
      builder: (SpeechToTextController controller) {
      return  SafeArea(
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      controller.stopListening();
                      Get.back();
                    },
                  ),
                ],
                backgroundColor: Colors.blue,
                title: const Text('Speech to Text'),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  controller.changeFloatingButtonIcon();
                  controller.floatingButtonIcon?
                  controller.startListening():controller.stopListening();
                  print('abdallah floating button ${controller.floatingButtonIcon}');
                  },
                child: controller.floatingButtonIcon? Icon(Icons.mic,color: Colors.white,) : Icon(Icons.mic_off_sharp,color: Colors.white,),
              ),
              body: Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(controller.textSpeech,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ),)
        );
      },

    );
  }
}
