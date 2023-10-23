import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:fs_translator/homePage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.green,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,

    ),
  );
  NoSplash.splashFactory;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  MobileAds.instance.initialize();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("Your One Signal SDK Key");
  OneSignal.Notifications.requestPermission(true);
  OneSignal.consentGiven(true);
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
