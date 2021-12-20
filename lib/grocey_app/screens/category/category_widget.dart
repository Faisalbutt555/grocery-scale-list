import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shopping/contants/app_colors.dart';
import 'package:shopping/grocey_app/model/category_model.dart';
import 'package:shopping/grocey_app/provider/createlist_provider.dart';
import 'package:shopping/grocey_app/screens/subcategories/subcatlist.dart';

class Categorywidget extends StatefulWidget {
  final CategoryModel categoryModel;
  final int index;
  const Categorywidget({
    required this.categoryModel,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<Categorywidget> createState() => _CategorywidgetState();
}

class _CategorywidgetState extends State<Categorywidget> {
  String? title;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            deletecategory(context);
          }),
          children: [
            SlidableAction(
              key: const ValueKey(0),
              onPressed: deletecategory,
              backgroundColor: Appcolors.redcolor,
              foregroundColor: Appcolors.whitecolor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        endActionPane: ActionPane(
          key: UniqueKey(),
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              key: const ValueKey(2),
              flex: 2,
              onPressed: editdialog,
              backgroundColor: const Color(0xFF7BC043),
              foregroundColor: Appcolors.whitecolor,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => GroceryItemScreen(
                          subItem: widget.categoryModel,
                        )));
          },
          child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            color: Appcolors.yellowcolor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(widget.categoryModel.title.toString(),
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const Text('=',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
        ));
  }

  void deletecategory(BuildContext context) {
    final provider = Provider.of<AddListProvider>(context, listen: false);
    provider.removeitem(widget.categoryModel);
  }

  void editdialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Form(
            key: formKey,
            child: AlertDialog(
              title: const Text(
                'Edit List Name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              contentPadding: const EdgeInsets.all(16.0),
              content: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter Title Name here';
                  } else {
                    null;
                  }
                },
                autofocus: true,
                initialValue: widget.categoryModel.title,
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
                    child: const Text(
                      'DONE',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        editcategory(context);
                        Navigator.pop(context);
                      }
                      log('Edit Form is not validate');
                    })
              ],
            ),
          );
        });
  }

  void editcategory(BuildContext context) {
    final provider = Provider.of<AddListProvider>(context, listen: false);
    provider.updateitem(widget.categoryModel, title!);
  }

  void oncancel(BuildContext context) {}
}
