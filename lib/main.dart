import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:fs_translator/homePage.dart';

Future<void> main() async {

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.green,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en',
      supportedLocales: ['en', 'hi', 'guj']);
  runApp(LocalizedApp(
    delegate,
     MaterialApp(
      home: const HomePage(),
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
    ),
  ));
}
