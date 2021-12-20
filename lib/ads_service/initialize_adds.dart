import 'package:easy_ads_flutter/easy_ads_flutter.dart';

class TestAdIdManager extends IAdIdManager {
  const TestAdIdManager();
  @override
  AppAdIds? get admobAdIds => const AppAdIds(
      appId: 'ca-app-pub-8949389946267549~6131193929',
      bannerId: "ca-app-pub-8949389946267549/5939622239",
      interstitialId: 'ca-app-pub-8949389946267549/3377231598');
  @override
  AppAdIds? get unityAdIds => const AppAdIds(appId: '4496253');
  @override
  AppAdIds? get appLovinAdIds => const AppAdIds(
        appId:
            '-8UPgneTQnQwkR_y4zSOx3RZE1HnncAlle9QPpurZIlIlkEphgCcldBzfTlR4vBqTKEz77ohPX-9GDyyv9Zdom',
        bannerId: '3d2a740761ff2fde',
        interstitialId: '486a815e7d614012',
      );
}
