import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:flutter/material.dart';

class ShowAdds extends StatelessWidget {
  const ShowAdds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .1,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: EasyBannerAd(
              adNetwork: AdNetwork.admob, adSize: AdSize.fullBanner),
        ),
      ),
    );
  }
}
