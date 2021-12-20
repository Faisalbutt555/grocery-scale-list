import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:shopping/addsservice/ad_setting_model.dart';
import 'package:shopping/addsservice/firebase_remote_config.dart';
import 'package:shopping/addsservice/initialize_adds.dart';

class AdManager {
  static const TestAdIdManager adIdManager = TestAdIdManager();
  // Singleton instance code
  static final AdManager _instance = AdManager._();
  static AdManager get instance => _instance;
  AdManager._();
  Future<void> initialize() async {
    const targetingInfo =
        AdRequest(nonPersonalizedAds: true, keywords: <String>[
      'santa track',
      'santa tracker',
      'santas',
      'norad santa tracker',
      'countdown for christmas',
      'norad',
      'call from santa',
      'santa calls',
      'books christmas',
      'where is santa',
      'christmas dinner',
      'father christmas',
    ]);

    final requestConf = RequestConfiguration(
      testDeviceIds: [
        '75FD9557226308357210C0CBE80AEBFD', // adeel bhai tablet
        'F11A4F2CCD0BB447FC573BF58881166E', // adeel bhai oppo phone
        '12C7EC57A67C1E1DA69AB81FACB3CA86', // zahid nokia 6.1
        '00008030-00163022226A802E',
        'D98E1FB86FB8EBF408A004D4DCC84F17', // abdullah j7 max
        '75792c0b6f3fb93524bfab6baf9f9d58', // hanzla's iPhone
        '072D2F3992EF5B4493042ADC632CE39F', // Mi Phone
        '0CAE94DF62B6C62D8EA6D89448803B48', // Abd Phone
        'DA993612B7A12CCFD0657754E17FC200', // ali khan
        '9CCB3003332191CFC2C3BECD83D37F90' //// faisal butt
      ],
      maxAdContentRating: MaxAdContentRating.pg,
    );
    await EasyAds.instance.initialize(adIdManager,
        admobConfiguration: requestConf, adMobAdRequest: targetingInfo);
  }

  bool showPriorityInterstitial({Function? onInterstitialClosed}) {
    final list = RemoteConfigService.instance.getAdSetting?.adPriorityList;
    if (list == null || list.isEmpty) {
      return EasyAds.instance.showAd(AdUnitType.interstitial);
    }
    for (int i = 0; i < list.length; i++) {
      if (list[i] == AdPriority.admob) {
        if (EasyAds.instance.showAd(AdUnitType.interstitial,
            adNetwork: AdNetwork.admob)) return true;
      } else if (list[i] == AdPriority.unity) {
        if (EasyAds.instance.showAd(AdUnitType.interstitial,
            adNetwork: AdNetwork.unity)) return true;
      } else if (list[i] == AdPriority.appLovin) {
        if (EasyAds.instance.showAd(AdUnitType.interstitial,
            adNetwork: AdNetwork.appLovin)) return true;
      }
    }

    return EasyAds.instance.showAd(AdUnitType.interstitial);
  }

  int _count = 0;

  void showCountedInterstitial() {
    _count++;
    final serverCounter =
        RemoteConfigService.instance.getAdSetting?.interstitialCounter ?? 2;
    if (_count == serverCounter) {
      showPriorityInterstitial();
      _count = 0;
    } else {
      EasyAds.instance.showAd(AdUnitType.interstitial);
    }
  }
}
