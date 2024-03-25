// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/add_expense_param_model.freezed.dart';
part 'generated/add_expense_param_model.g.dart';

@freezed
class AddExpenseParamModel with _$AddExpenseParamModel {
  const factory AddExpenseParamModel({
    @JsonKey(name: "amount") required double amount,
    @JsonKey(name: "category_id") required int idCategory,
    @JsonKey(name: "notes") required String notes,
    @JsonKey(name: "date") required String date,
  }) = _AddExpenseParamModel;

  factory AddExpenseParamModel.fromJson(Map<String, dynamic> json) =>
      _$AddExpenseParamModelFromJson(json);
}
