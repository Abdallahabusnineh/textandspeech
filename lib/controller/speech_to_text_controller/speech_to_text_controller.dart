
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextController extends GetxController{
  final SpeechToText speech = SpeechToText();
  bool speechEnabled = false;
  String textSpeech = '';
  bool floatingButtonIcon = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initSpeech();
  }

  void initSpeech() async {
    speechEnabled= await speech.initialize();
    print('speech is enabled? $speechEnabled');
    update();
  }
  void startListening() async {
    if(speechEnabled){
      await speech.listen(onResult: (result) {
        floatingButtonIcon = true;
          textSpeech = result.recognizedWords;
          print(result.recognizedWords);
      });
      print('start listening');
      update();
    }
    else
      textSpeech = 'speech not enabled';
  }

  void stopListening() async {
    floatingButtonIcon = false;
    await speech.stop();
    print('stop listening');
    update();
  }
  void changeFloatingButtonIcon(){
    floatingButtonIcon = !floatingButtonIcon;
    update();
  }

}