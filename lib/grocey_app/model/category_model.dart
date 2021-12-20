import 'package:json_annotation/json_annotation.dart';
import 'package:shopping/grocey_app/model/subcat_model.dart';
part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel {
  String? title;
  List<SubCatModel> subCategories;
  bool isdone;
  CategoryModel(
      {required this.title, required this.subCategories, this.isdone = false});
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
