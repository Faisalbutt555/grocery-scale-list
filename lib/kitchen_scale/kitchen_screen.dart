import 'dart:ui';
import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shopping/contants/app_colors.dart';
import 'package:shopping/kitchen_scale/kitchen_model/kitchen_model.dart';

class KitchennScreen extends StatefulWidget {
  final int id;
  const KitchennScreen({Key? key, required this.id}) : super(key: key);
  @override
  _KitchennScreenState createState() => _KitchennScreenState();
}

class _KitchennScreenState extends State<KitchennScreen> {
  List<KitchenModel> kichenmodel = Utils.getlist();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Scrollbar(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
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
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: kichenmodel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              kichenmodel[index].title!,
                              style: const TextStyle(
                                  color: Appcolors.brown,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              kichenmodel[index]
                                  .subtitlelist!
                                  .join(',')
                                  .trim()
                                  .toString(),
                              style: const TextStyle(
                                  color: Appcolors.brown,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          kichenmodel[index].img == null
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              kichenmodel[index].img!,
                                            ),
                                            fit: BoxFit.cover)),
                                    height: 150,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
