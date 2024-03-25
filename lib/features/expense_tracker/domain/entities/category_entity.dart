// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../resorses/enums.dart';
part 'generated/category_entity.freezed.dart';
part 'generated/category_entity.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: "category_type") required CategoryType categoryType,
    @JsonKey(name: "total_amount") @Default(0) double totalAmount,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
