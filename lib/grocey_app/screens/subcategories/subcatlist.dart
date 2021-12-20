import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/contants/app_colors.dart';
import 'package:shopping/grocey_app/model/category_model.dart';
import 'package:shopping/grocey_app/provider/createlist_provider.dart';
import 'package:shopping/grocey_app/screens/subcategories/subcategory_widget.dart';

import 'package:shopping/widgets/empty_widget.dart';
import 'package:shopping/widgets/share_function.dart';

class GroceryItemScreen extends StatefulWidget {
  final CategoryModel subItem;
  const GroceryItemScreen({Key? key, required this.subItem}) : super(key: key);
  @override
  State<GroceryItemScreen> createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool issort = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          // const IconButton(onPressed: share, icon: Icon(Icons.share)
          // ),
          SizedBox(
            height: 30,
            child: PopupMenuButton<int>(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              color: Appcolors.whitecolor,
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: const [Text("Sort Alphabetically")],
                    )),
              ],
              onSelected: (item) {
                setState(() {
                  issort = !issort;
                });
                showtoast();
              },
            ),
          ),
        ],
        shadowColor: Colors.blue,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                widget.subItem.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                    fontSize: 20,
                    color: Appcolors.whitecolor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .1,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: EasyBannerAd(
                    adNetwork: AdNetwork.admob, adSize: AdSize.fullBanner),
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: widget.subItem.subCategories.isEmpty
                  ? const Center(
                      child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: EmptyWidget(),
                    ))
                  : ReorderableListView(
                      key: ObjectKey(widget.subItem),
                      children: List.generate(
                          widget.subItem.subCategories.length, (index) {
                        final sortedlist = issort
                            ? (widget.subItem.subCategories
                              ..sort((item1, item2) =>
                                  item1.subtitle!.compareTo(item2.subtitle!)))
                            : widget.subItem.subCategories;
                        final item = sortedlist[index];
                        return Padding(
                          key: ValueKey(sortedlist[index]),
                          padding: const EdgeInsets.all(8.0),
                          child: SubCategorywidget(
                            index: index,
                            txt: item.subtitle ?? '',
                            categoryModel: widget.subItem,
                          ),
                        );
                      }),
                      onReorder: (int oldIndex, int newIndex) {
                        if (newIndex > widget.subItem.subCategories.length) {
                          newIndex = widget.subItem.subCategories.length;
                        }
                        if (oldIndex < newIndex) newIndex -= 1;
                        setState(() {
                          final item = widget.subItem.subCategories[oldIndex];
                          widget.subItem.subCategories.removeAt(oldIndex);
                          widget.subItem.subCategories.insert(newIndex, item);
                        });
                        provider.savecatlistlocally();
                      }),
            ),
          ),
          TextFormField(
              autovalidateMode: AutovalidateMode.always,
              validator: (value) =>
                  value!.isEmpty ? 'Subtitle cannot be blank' : null,
              controller: controller,
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () async {
                      if (controller.text.isNotEmpty) {
                        provider.addsublist(widget.subItem, controller);
                        controller.clear();
                      } else {}
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircleAvatar(child: Icon(Icons.art_track)),
                    ),
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.yellow[200],
                  hintText: 'Type here',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ))),
        ],
      ),
    );
  }
}
