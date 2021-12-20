import 'package:json_annotation/json_annotation.dart';
part 'subcat_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SubCatModel {
  String? subtitle;
  bool ischeck;
  SubCatModel({
    required this.subtitle,
    this.ischeck = false,
  });
  factory SubCatModel.fromJson(Map<String, dynamic> json) =>
      _$SubCatModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubCatModelToJson(this);
}
