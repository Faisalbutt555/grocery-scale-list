import 'package:flutter/material.dart';

class ButtonClass extends StatelessWidget {
  final VoidCallback voidCallback;
  final String img;
  final String txt;
  const ButtonClass({
    Key? key,
    required this.voidCallback,
    required this.txt,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        height: 100,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.lightBlue[300],
            borderRadius: BorderRadius.circular(08),
            border: Border.all(
              color: Colors.white,
              width: 0.6,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                txt,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset(
                img,
                height: 40,
                width: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
