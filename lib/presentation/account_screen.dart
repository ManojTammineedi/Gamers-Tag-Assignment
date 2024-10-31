import 'package:flutter/material.dart';
import 'package:gamerstag/controller/language_controller.dart';
import 'package:gamerstag/constants/app_strings.dart';
import 'package:get/get.dart';
import 'language_button.dart';
import 'language_dialog.dart'; // Import the LanguageDialog component

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.put(LanguageController());

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Account Language')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Obx(() {
                  return Text(
                    '${languageController.selectedLanguages.length} Languages Added',
                    style: TextStyle(fontSize: 14),
                  );
                }),
                Spacer(),
                ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => LanguageDialog(
                        controller:
                            languageController),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(0, 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    'Add Languages',
                    style: TextStyle(color: Colors.black, fontSize: 11),
                  ),
                ),
              ],
            ),
            Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black,
                      width: double.infinity,
                      height: 25,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('LANGUAGES',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Obx(
                      () => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 5.0,
                              runSpacing: 5.0,
                              children: languageController.selectedLanguages
                                  .map((language) =>
                                      LanguageButton(label: language))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
