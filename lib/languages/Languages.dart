import 'package:astro_guide/languages/EnglishLanguage.dart';
import 'package:astro_guide/languages/HindiLanguage.dart';
import 'package:astro_guide/languages/TeluguLanguage.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': english,
    'hi': hindi,
    'te': telugu,
  };

  Map<String, String> get languages => {
    'en': "English",
    'hi': "Hindi",
    'te': "Telugu",
  };

  Map<String, String> get messages => {
    'en': "Hello",
    'hi': "नमस्ते",
    'te': "హలో",
  };
}