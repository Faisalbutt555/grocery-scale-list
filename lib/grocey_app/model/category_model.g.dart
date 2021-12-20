// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      title: json['title'] as String?,
      subCategories: (json['subCategories'] as List<dynamic>)
          .map((e) => SubCatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isdone: json['isdone'] as bool? ?? false,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subCategories': instance.subCategories.map((e) => e.toJson()).toList(),
      'isdone': instance.isdone,
    };
