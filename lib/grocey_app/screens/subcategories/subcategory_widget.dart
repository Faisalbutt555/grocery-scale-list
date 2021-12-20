import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shopping/contants/app_colors.dart';
import 'package:shopping/grocey_app/model/category_model.dart';
import 'package:shopping/grocey_app/provider/createlist_provider.dart';

class SubCategorywidget extends StatefulWidget {
  final String? txt;
  final int index;
  final CategoryModel categoryModel;
  const SubCategorywidget({
    Key? key,
    this.txt,
    required this.categoryModel,
    required this.index,
  }) : super(key: key);
  @override
  State<SubCategorywidget> createState() => _SubCategorywidgetState();
}

class _SubCategorywidgetState extends State<SubCategorywidget> {
  late TextEditingController controler;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    controler = TextEditingController(text: widget.txt);
  }

  get notedit => null;
  get notdelete => null;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddListProvider>(context);
    return Slidable(
      key: ObjectKey(widget.index),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: widget.categoryModel.subCategories[widget.index].ischeck
            ? DismissiblePane(
                key: ObjectKey(widget.index),
                onDismissed: () {
                  widget.categoryModel.subCategories[widget.index].ischeck
                      ? provider.removesubitem(
                          context, widget.categoryModel, widget.index)
                      : notdelete;
                })
            : null,
        children: [
          SlidableAction(
            key: ObjectKey(widget.index),
            onPressed: (context) {
              widget.categoryModel.subCategories[widget.index].ischeck
                  ? provider.removesubitem(
                      context, widget.categoryModel, widget.index)
                  : notdelete;
            },
            backgroundColor: Appcolors.redcolor,
            foregroundColor: Appcolors.whitecolor,
            icon: widget.categoryModel.subCategories[widget.index].ischeck
                ? Icons.delete
                : Icons.delete_forever,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            key: ObjectKey(widget.index),
            flex: 2,
            onPressed: widget.categoryModel.subCategories[widget.index].ischeck
                ? notedit
                : editdialog,
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Appcolors.whitecolor,
            icon: widget.categoryModel.subCategories[widget.index].ischeck
                ? Icons.edit_off_sharp
                : Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Card(
        elevation: 2,
        child: CheckboxListTile(
          key: ValueKey(widget.index),
          value: widget.categoryModel.subCategories[widget.index].ischeck,
          onChanged: (val) {
            setState(() {
              widget.categoryModel.subCategories[widget.index].ischeck = val!;
            });
            provider.savecatlistlocally();
          },
          activeColor: Colors.grey,
          checkColor: Appcolors.greycolor,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(widget.txt ?? '',
              overflow: TextOverflow.visible,
              maxLines: 2,
              softWrap: true,
              style: TextStyle(
                  color:
                      widget.categoryModel.subCategories[widget.index].ischeck
                          ? Colors.grey
                          : Colors.black,
                  fontSize: 16,
                  fontWeight:
                      widget.categoryModel.subCategories[widget.index].ischeck
                          ? FontWeight.w600
                          : FontWeight.w400,
                  decoration:
                      widget.categoryModel.subCategories[widget.index].ischeck
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
        ),
      ),
    );
  }

  void editdialog(BuildContext context) {
    final prov = Provider.of<AddListProvider>(context, listen: false);
    showDialog(
        context: context,
        builder: (context) {
          return Form(
            key: _formKey,
            child: AlertDialog(
              title: const Text(
                'Edit',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              contentPadding: const EdgeInsets.all(16.0),
              content: TextFormField(
                controller: controler,
                autovalidateMode: AutovalidateMode.always,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter  Title  here';
                  } else {
                    null;
                  }
                },
                //  initialValue: widget.txt,
                onChanged: (categorytitle) {
                  //  setState(() =>  = categorytitle);
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
                      if (controler.text.isNotEmpty) {
                        prov.updatesubitem(
                            widget.categoryModel, widget.index, controler.text);
                        Navigator.pop(context);
                      }
                      // ignore: avoid_print
                      print('Form is not validate');
                    })
              ],
            ),
          );
        });
  }

  void oncancel(BuildContext context) {}
}
