import 'package:flutter/material.dart';

class DrawerComponents extends StatelessWidget {
  final String name;
  final String img;
  final VoidCallback ontap;
  const DrawerComponents(
      {Key? key, required this.name, required this.img, required this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          Image.asset(
            img,
            height: 30,
            width: 50,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
