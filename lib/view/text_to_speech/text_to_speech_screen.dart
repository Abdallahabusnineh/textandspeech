import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/text_to_speech_controller/text_to_speech_controller.dart';

class TextToSpeechScreen extends StatelessWidget {
  const TextToSpeechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back),
              //test branch
              //test branch
            ),
          ],
          backgroundColor: Colors.blue,
          title: Text(
              'Text To Speech',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body:  GetBuilder<TextToSpeechController>(
          init: TextToSpeechController(),
          builder: (TextToSpeechController controller) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, children: [
                DropdownButton(
                  borderRadius: BorderRadius.circular(10),
                  value: controller.currentVoice,
                  items: controller.voiceList
                      .map((voice) => DropdownMenuItem(
                    value: voice,
                    child: Text(voice['name']),
                  ))
                      .toList(),
                  onChanged: (value) {
                      controller.currentVoice = value as Map;
                      controller.setVoice(controller.currentVoice!);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                      labelText: 'enter text',
                    ),
                    onChanged: (value) {
                        controller.text = value;
                    },
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(onPressed: (){
                        controller.startAudioPlaying();
                       }, icon: controller.audioIsPlaying?Icon(Icons.pause):Icon(Icons.play_arrow,color: Colors.blue,)),
                    ),
                   controller.audioIsPlaying? Expanded(
                      child: IconButton(onPressed: (){
                        controller.stopAudioPlaying();
                       }, icon: controller.audioIsPlaying?Icon(Icons.stop,color: Colors.red,):SizedBox()),
                    ):SizedBox(),
                  ],
                ),
                     Slider(
                    value: controller.volume,
                    onChanged: (newVolume) {
                     controller.changeVolume(newVolume);
                    },

                    min: 0.0,
                    max: 1.0,
                    divisions: 100,
                    activeColor: Colors.blue,
                     label: "Volume: ${controller.volume*100}",),
              ]),
            );
          },
        ),
      ),
    );
  }
}
