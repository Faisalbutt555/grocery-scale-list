import 'package:flutter/material.dart';
import 'package:shopping/contants/app_colors.dart';
import 'package:shopping/widgets/alert_dialog.dart';

class Floatingbutton extends StatelessWidget {
  const Floatingbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CustomAlertDialog();
          },
        );
      },
      child: const Icon(
        Icons.add,
        color: Appcolors.whitecolor,
      ),
    );
  }
}
