import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/grocey_app/provider/createlist_provider.dart';
import 'package:shopping/grocey_app/screens/category/category_widget.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddListProvider>(context);
    final category = provider.list;
    return Scaffold(
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
            child: ReorderableListView(
                children: List.generate(
                  category.length,
                  (index) {
                    final cat = category[index];
                    return Padding(
                      key: ValueKey(index),
                      padding: const EdgeInsets.all(8.0),
                      child: Categorywidget(categoryModel: cat, index: index),
                    );
                  },
                ).toList(),
                onReorder: (int oldIndex, int newIndex) async {
                  if (newIndex > category.length) {
                    newIndex = category.length;
                  }
                  if (oldIndex < newIndex) newIndex -= 1;
                  setState(() {
                    final item = category[oldIndex];
                    category.removeAt(oldIndex);
                    category.insert(newIndex, item);
                  });
                  provider.savecatlistlocally();
                }),
          ),
        ],
      ),
    );
  }
}
