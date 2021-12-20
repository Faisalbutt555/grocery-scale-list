import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/grocey_app/model/category_model.dart';
import 'package:shopping/grocey_app/model/subcat_model.dart';

class AddListProvider extends ChangeNotifier {
  List<CategoryModel> list = [];

  // List<CategoryModel> get categories =>
  //     list.where((cat) => cat.isdone == false).toList();
  /////add  list//////////

  void savecatlistlocally() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> splist = list.map((e) => json.encode(e.toJson())).toList();
    sharedPreferences.setStringList(
      'categorylist',
      splist,
    );

    notifyListeners();
    // ignore: avoid_print
    print(splist);
  }

  Future<bool> loaddata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final splist = sharedPreferences.getStringList('categorylist');
    if (splist == null) return false;
    list = splist.map((e) => CategoryModel.fromJson(json.decode(e))).toList();
    // ignore: avoid_print
    print(splist);
    notifyListeners();
    return true;
  }

//////////////////////////////////////////////////////////   Add List /////////////////////////////////////////
  void addlist(CategoryModel categoryModel) {
    list.add(categoryModel);
    savecatlistlocally();

    notifyListeners();
  }

//////////////////////////////////////////////////////////   Add SubList /////////////////////////////////////////

  void addsublist(
      CategoryModel categoryModel, TextEditingController controller) {
    categoryModel.subCategories.add(SubCatModel(subtitle: controller.text));
    savecatlistlocally();
    notifyListeners();
  }

//////////////////////////////////////////////////////////   Remove Item  /////////////////////////////////////////

  void removeitem(CategoryModel categoryModel) {
    list.remove(categoryModel);
    savecatlistlocally();
    notifyListeners();
  }
//////////////////////////////////////////////////////////   Remove SubItem  /////////////////////////////////////////

  void removesubitem(BuildContext context, CategoryModel categoryModel, index) {
    categoryModel.subCategories.removeAt(index);
    savecatlistlocally();
    notifyListeners();
  }

//////////////////////////////////////////////////////////   Update Item  /////////////////////////////////////////
  void updateitem(CategoryModel categoryModel, String title) {
    categoryModel.title = title;
    savecatlistlocally();
    notifyListeners();
  }

  //////////////////////////////////////////////////////////   Update SubItem  /////////////////////////////////////////
  void updatesubitem(CategoryModel categoryModel, index, String txt) {
    categoryModel.subCategories[index].subtitle = txt;
    savecatlistlocally();
    notifyListeners();
  }

  //////////////

  void updatesubitemCheckBox(SubCatModel categoryModel) {
    categoryModel.ischeck = true;
    savecatlistlocally();
    notifyListeners();
  }
}
