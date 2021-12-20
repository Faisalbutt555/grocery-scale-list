// @dart=2.9
import 'dart:developer';
import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/bmi_calculator/input_page.dart';
import 'package:shopping/grocey_app/provider/createlist_provider.dart';
import 'package:shopping/grocey_app/screens/category/categoryhome_screen.dart';
import 'package:shopping/kitchen_scale/kitchen_screen.dart';
import 'package:shopping/select_app/button_widget.dart';
import 'package:shopping/widgets/drawer_class.dart';
import 'package:shopping/widgets/privacy_policy.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectApp extends StatefulWidget {
  final int id;
  const SelectApp({Key key, this.id}) : super(key: key);
  @override
  _SelectAppState createState() => _SelectAppState();
}

class _SelectAppState extends State<SelectApp> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AddListProvider>(context, listen: false);
    provider.loaddata();
    log("${provider.loaddata()}");
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromRGBO(86, 204, 242, 1),
            Color.fromRGBO(47, 128, 237, 1),
          ])),
      child: Scaffold(
          key: _key,
          drawer: DrawerClass(),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () => _key.currentState.openDrawer(),
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                  ),
                  Text(
                    'Kitchen Grocery Scale',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonClass(
                          img: 'images/groceryimg.png',
                          voidCallback: () {
                            EasyAds.instance.showAd(AdUnitType.interstitial,
                                adNetwork: AdNetwork.admob);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HomeScreen(
                                          id: widget.id,
                                        )));
                          },
                          txt: 'Shopping List'),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonClass(
                          img: 'images/kitchenscaleimg.png',
                          voidCallback: () {
                            EasyAds.instance
                                .showRandomAd(AdUnitType.interstitial);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => KitchennScreen(
                                          id: widget.id,
                                        )));
                          },
                          txt: 'Kitchen Scale'),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonClass(
                          img: 'images/calimg.png',
                          voidCallback: () {
                            EasyAds.instance
                                .showRandomAd(AdUnitType.interstitial);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => InputPage(
                                          id: widget.id,
                                        )));
                          },
                          txt: 'BMI Calculator'),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: EasyBannerAd(
                            adNetwork: AdNetwork.admob,
                            adSize: AdSize.fullBanner),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
