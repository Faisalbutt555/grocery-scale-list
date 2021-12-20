// @dart=2.9
import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/addsservice/initialize_adds.dart';
import 'package:shopping/grocey_app/provider/createlist_provider.dart';
import 'package:shopping/select_app/select_ap.dart';

const IAdIdManager adIdManager = TestAdIdManager();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyAds.instance.initialize(
    adIdManager,
    unityTestMode: true,
    adMobAdRequest: const AdRequest(),
    admobConfiguration: RequestConfiguration(testDeviceIds: [
      '072D2F3992EF5B4493042ADC632CE39F', // Mi Phone
      '00008030-00163022226A802E',
    ]),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int id = 0;
    return ChangeNotifierProvider(
      create: (_) => AddListProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: id == 2
              ? ThemeData.dark().copyWith(
                  primaryColor: const Color(0xff0A0E21),
                  scaffoldBackgroundColor: const Color(0xff0A0E21),
                )
              : ThemeData(
                  primarySwatch: Colors.blue,
                ),
          home: SelectApp(
            id: id,
          )),
    );
  }
}
