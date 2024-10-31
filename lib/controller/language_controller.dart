import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLanguages = <String>[].obs;
  var tempSelectedLanguages = <String>[].obs;

  void toggleTempLanguage(String language) {
    if (tempSelectedLanguages.contains(language)) {
      tempSelectedLanguages.remove(language);
    } else {
      tempSelectedLanguages.add(language);
    }
  }
 
  void saveSelectedLanguages() {
    selectedLanguages.assignAll(tempSelectedLanguages);
  }

  void resetTempLanguages() {
    tempSelectedLanguages.assignAll(selectedLanguages);
  }
}
