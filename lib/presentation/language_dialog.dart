import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gamerstag/controller/language_controller.dart';
import 'package:gamerstag/constants/app_strings.dart';

class LanguageDialog extends StatelessWidget {
  final LanguageController controller;

  const LanguageDialog({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.resetTempLanguages();

    return Dialog(
      child: Container(
        width: 550,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/dialogue.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text(
                "ADD LANGUAGE",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                alignment: WrapAlignment.center,
                children: [
                  for (String language in AppStrings.supportedLanguages)
                    Obx(() {
                      return SizedBox(
                        width: 90,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () => controller.toggleTempLanguage(language),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: controller.tempSelectedLanguages.contains(language)
                                ? Colors.red
                                : const Color.fromARGB(255, 51, 51, 51),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: Text(
                            language,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      );
                    }),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 87),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'CANCEL',
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    ),
                  ),
                  SizedBox(width: 15),
                  TextButton(
                    onPressed: () {
                      controller.saveSelectedLanguages();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'SAVE',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
