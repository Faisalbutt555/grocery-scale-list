import 'package:flutter/material.dart';

class EmptyWidget extends StatefulWidget {
  const EmptyWidget({Key? key}) : super(key: key);
  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'Welcome',
          style: TextStyle(
              fontSize: 18, color: Colors.blue, fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Click the yellow box below to type your first item',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.blue, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
