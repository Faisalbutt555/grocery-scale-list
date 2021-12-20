import 'package:flutter/material.dart';
import 'package:shopping/contants/app_colors.dart';

class EmptyCatScreen extends StatefulWidget {
  const EmptyCatScreen({Key? key}) : super(key: key);

  @override
  State<EmptyCatScreen> createState() => _EmptyCatScreenState();
}

class _EmptyCatScreenState extends State<EmptyCatScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(height: 150),
        Text(
          'Welcome',
          style: TextStyle(
              fontSize: 18, color: Colors.blue, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Click on  the + below to add your first Category',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.blue, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
