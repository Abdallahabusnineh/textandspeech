import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../core/show_toast.dart';
class TextToSpeechController extends GetxController {
  FlutterTts flutterTts = FlutterTts();
  String text ='';
  int? currentStartWord, currentEndWord;
  List<Map> voiceList = [];
  Map? currentVoice;
  double volume = .5;
  bool audioIsPlaying = false;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    flutterTts.stop();
  }
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initTTS();
  }
  void initTTS() async {
    flutterTts.getVoices.then((voices) {
      try {
       /* voiceList = List<Map>.from(voices);
        voiceList=voiceList.where((element) => element['name'].toString().contains('en-US')).toList();
       */
        voiceList.add({'name': 'English', 'locale': 'en'});
        voiceList.add({'name': 'Arabic', 'locale': 'ar'});
        print(voiceList);
          currentVoice=voiceList[0];
          setVoice(currentVoice!);
      } catch (e) {
        print(e);
      }
     update();
    });
  }

  void setVoice(Map voice) {
    flutterTts.setVoice({'name': voice['name'], 'locale': voice['locale']});
  update();
  }
  void textBackgroundColor(){
    flutterTts.setProgressHandler((String text, int startOffset, int endOffset, String word) {
      currentStartWord = startOffset;
      currentEndWord = endOffset;
    });
    }

void startAudioPlaying(){
  if(text.isNotEmpty){
    audioIsPlaying=!audioIsPlaying;
    print(audioIsPlaying);
    audioIsPlaying?flutterTts.speak(text):
    flutterTts.pause();
  }
  else
    showToast(text: 'enter text to play it ', state: ToastState.ERROR);
  update();

}
void stopAudioPlaying(){
    flutterTts.stop();
    audioIsPlaying=false;
    print(audioIsPlaying);
    showToast(text: 'audio stopped', state: ToastState.SUCCESS);
  update();

}
setLanguage(){
    if(currentVoice!['locale']=='ar'){
      flutterTts.setLanguage('ar-SA');
      showToast(text: 'language changed to arabic', state: ToastState.SUCCESS);
    }
    else{
      flutterTts.setLanguage('en');
      showToast(text: 'language changed to english', state: ToastState.SUCCESS);
    }
  update();
}

/*void clearText(){
  text='';
  update();
}*/
void changeVolume(double value)async{
  volume=value;
  await flutterTts.setVolume(volume);
  update();
}

}
