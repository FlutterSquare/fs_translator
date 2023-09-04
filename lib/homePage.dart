import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

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
          actions: [
            IconButton(
                onPressed: () => showBottomSheet(),
                icon: const Icon(Icons.language_outlined))
          ],
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
          const SizedBox(
            height: 20,
          ),
          Text(
            translate("AppString.BodyTwo"),
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  showBottomSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text(translate('AppString.BottomSheetTitle')),
          cancelButton: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.cancel)),
          actions: [
            CupertinoActionSheetAction(
                onPressed: () {
                  setState(() {
                    changeLocale(context, "en");
                  });
                  Navigator.pop(context, 'en');
                },
                child: Text(translate('AppString.LanguageEnglish'))),
            CupertinoActionSheetAction(
                onPressed: () {
                  setState(() {
                    changeLocale(context, "hi");
                  });
                  Navigator.pop(context, 'hi');
                },
                child: Text(translate('AppString.LanguageHindi'))),
            CupertinoActionSheetAction(
                onPressed: () {
                  setState(() {
                    changeLocale(context, "guj");
                  });
                  Navigator.pop(context, 'guj');
                },
                child: Text(translate('AppString.LanguageGujarati'))),
          ],
        );
      },
    );
  }
}
