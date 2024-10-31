import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gamerstag/presentation/account_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Change from MaterialApp to GetMaterialApp
      debugShowCheckedModeBanner: false,
      title: 'Language Manager',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => AccountPage(),
        ),
      ],
    );
  }
}
