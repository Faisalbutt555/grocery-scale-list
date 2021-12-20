import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/grocey_app/model/category_model.dart';
import 'package:shopping/grocey_app/provider/createlist_provider.dart';

class CustomAlertDialog extends StatefulWidget {
  final CategoryModel? categoryModel;
  const CustomAlertDialog({
    Key? key,
    this.categoryModel,
  }) : super(key: key);
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  String? title;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        title: const Text(
          'Enter List Name',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        contentPadding: const EdgeInsets.all(16.0),
        content: TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.always,
          validator: (value) => value!.isEmpty ? 'Title cannot be blank' : null,
          autofocus: true,
          onChanged: (categorytitle) {
            setState(() => title = categorytitle);
          },
          decoration: const InputDecoration(),
        ),
        actions: <Widget>[
          TextButton(
              child: const Text(
                'CANCEL',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          TextButton(
              child: Text(
                'DONE',
                style: TextStyle(
                    color: controller.text.isEmpty ? Colors.grey : Colors.black,
                    fontSize: 15,
                    fontWeight: controller.text.isEmpty
                        ? FontWeight.w500
                        : FontWeight.w800),
              ),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  addcategory();
                  EasyAds.instance.showRandomAd(AdUnitType.interstitial);
                  Navigator.pop(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => GroceryItemScreen(
                  //               subItem: widget.categoryModel.,
                  //             )));
                } else {
                  // ignore: avoid_print
                  print('form is invalid');
                }
              })
        ],
      ),
    );
  }

  void addcategory() {
    final category = CategoryModel(title: title, subCategories: []);
    final provider = Provider.of<AddListProvider>(context, listen: false);
    provider.addlist(category);
  }
}
