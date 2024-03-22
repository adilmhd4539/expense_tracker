// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../resorses/enums.dart';
part 'generated/category_model.freezed.dart';
part 'generated/category_model.g.dart';

@freezed
@HiveType(typeId: 1)
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @HiveField(0) @JsonKey(name: "category_name") required String categoryName,
    @HiveField(1)
    @JsonKey(name: "category_time")
    required CategoryType categoryType,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
