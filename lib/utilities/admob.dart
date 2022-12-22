import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';
import 'app_constrant.dart';
import 'package:get/get.dart';
class AdmobHelper extends GetxController {

  var id = "".obs;
  var status = "".obs;

  @override
  void onInit() {

    super.onInit();
  }

  getData()async{
    QuerySnapshot AppOpenAd = await FirebaseFirestore.instance.collection("BannerAd").get();
    var clientData = AppOpenAd.docs;
    id.value = clientData[0]["bannerAdId"];
    status.value = clientData[0]["status"];
  }

  InterstitialAd? _interstitialAd;
  bool _islAdLoaded = false;
  int _interstitialLoadAttempts = 0;
   int maxFailedLoadAttempts = 3;

  // IsSilly _isSilly;
   BannerAd getBannerAd() {

    BannerAd? bAd;
    if(status.value == "enable"){
      bAd =  BannerAd(
          size: AdSize.banner,
          adUnitId: id.value,
          listener: BannerAdListener(onAdClosed: (Ad ad) {
            print("Ad Closed");
          }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
          }, onAdLoaded: (Ad ad) {
            print('Ad Loaded');
          }, onAdOpened: (Ad ad) {
            print('Ad opened');
          }),
          request: AdRequest());
    }
    return bAd!;
  }


//
//   Future<BannerAd> getBannerAdd() async {
//     BannerAd? bAd;
//     if(clientData[0]["status"] == "enable"){
//       bAd =  BannerAd(
//           size: AdSize.banner,
//           adUnitId: clientData[0]["bannerAdId"],
//           listener: BannerAdListener(onAdClosed: (Ad ad) {
//             print("Ad Closed");
//           }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
//             ad.dispose();
//           }, onAdLoaded: (Ad ad) {
//             bAd!.load();
//             print('Ad Loaded');
//           }, onAdOpened: (Ad ad) {
//             print('Ad opened');
//           }),
//           request: AdRequest());
//       return bAd;
//     }
// return bAd!;
//   }

  Future<void> createInterad() async {
    QuerySnapshot AppOpenAd = await FirebaseFirestore.instance.collection("InterstitialAd").get();
    var clientData = AppOpenAd.docs;
      if(clientData[0]["status"] == "enable"){
        InterstitialAd.load(
            adUnitId: clientData[0]["InterstitialAdId"],
            request: AdRequest(),
            adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
              _interstitialAd = ad;
              _interstitialLoadAttempts = 0;
            }, onAdFailedToLoad: (LoadAdError error) {
              _interstitialLoadAttempts += 1;
              _interstitialAd = null;
              if (_interstitialLoadAttempts <= maxFailedLoadAttempts) {
                createInterad();
              }
            }));
      }
  }

  // create interstitial ads
  Future<void> createInteradd() async {
    QuerySnapshot AppOpenAd = await FirebaseFirestore.instance.collection("InterstitialAd").get();
    var adData = AppOpenAd.docs;
    if(adData[0]["status"] == "enable"){
      InterstitialAd.load(
          adUnitId: AdHelper.interstitialAdUnitId,
          request: AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
            _interstitialAd = ad;
            _interstitialLoadAttempts = 0;
          }, onAdFailedToLoad: (LoadAdError error) {
            _interstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_interstitialLoadAttempts <= maxFailedLoadAttempts) {
              createInterad();
            }
          }));
    }
  }

  void showInterad() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            ad.dispose();
            createInterad();
          }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        createInterad();
      });
      _interstitialAd!.show();
    }
  }

   Future<Map> getBannerAdId()async{
    QuerySnapshot AppOpenAd = await FirebaseFirestore.instance.collection("BannerAd").get();
    var adData = AppOpenAd.docs;
    Map<String, String> mydata = {
      "adId" : adData[0]["bannerAdId"],
      "status" : adData[0]["status"],
    };
    return mydata;
  }

}
