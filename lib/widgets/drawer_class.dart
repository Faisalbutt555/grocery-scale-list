import 'package:flutter/material.dart';
import 'package:shopping/widgets/drawer_components.dart';
import 'package:shopping/widgets/privacy_policy.dart';
import 'package:shopping/widgets/share_function.dart';

class DrawerClass extends StatelessWidget {
  const DrawerClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromRGBO(86, 204, 242, 1),
              Color.fromRGBO(47, 128, 237, 1),
            ])),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              DrawerComponents(
                  name: 'Privacy Policy',
                  img: 'images/privacypolicy.png',
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PrivacyPolicy()));
                  }),
              SizedBox(
                height: 20,
              ),
              DrawerComponents(
                  name: 'Rate us',
                  img: 'images/rateus.png',
                  ontap: () {
                    launchURL();
                  }),
              SizedBox(
                height: 20,
              ),
              DrawerComponents(
                  name: 'Other Apps',
                  img: 'images/more.png',
                  ontap: () {
                    launchURL();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
