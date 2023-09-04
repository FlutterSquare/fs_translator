import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class Translator extends StatefulWidget {
  const Translator({super.key});

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  BannerAd? bannerAd;
  static bool isBannerAdLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBanner();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.pop(context),icon: const Icon(CupertinoIcons.back)),
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
          const SizedBox(height: 30,),
          Center(
            child: Container(
              height: 50,
              width: 320,
              color: Colors.white10,
              child: isBannerAdLoaded?AdWidget(ad: bannerAd!):const SizedBox(),
            ),
          ),
          const SizedBox(
            height: 30,
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
  void loadBanner() {
      bannerAd = BannerAd(
        // adUnitId: "ca-app-pub-3940256099942544/6300978111",
        adUnitId: "ca-app-pub-6218510907310003/5292640613",
        request: AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            print('$ad ================Banner Ad loaded.');
            setState(() {
              isBannerAdLoaded = true;
            });
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (ad, err) {
            print('====================BannerAd failed to load: $err');
            setState(() {
              isBannerAdLoaded = false;
            });
            // Dispose the ad here to free resources.
            ad.dispose();
          },
        ),
      )..load();

  }
}
