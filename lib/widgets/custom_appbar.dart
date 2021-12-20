import 'package:flutter/material.dart';
import 'package:shopping/contants/app_colors.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.blue,
      backgroundColor: Colors.blue,
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'Shopping List',
            style: TextStyle(
                fontSize: 20,
                color: Appcolors.whitecolor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
