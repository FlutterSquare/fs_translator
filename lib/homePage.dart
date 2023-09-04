import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:fs_translator/translator.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(CupertinoIcons.home),
          title: Text(translate('AppString.AppTitle'),
              style: const TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Center(
              child: Text(
            translate('AppString.CurrentLanguage'),
            style: const TextStyle(fontSize: 20),
          )),
          const SizedBox(
            height: 30,
          ),
          Text(
            translate("AppString.BodyOne"),
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 30,),
          Text(
            translate("AppString.BodyTwo"),
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Translator();
            },));
          }, child: const Text("View Demo"))
        ],
      ),
    );
  }

}
