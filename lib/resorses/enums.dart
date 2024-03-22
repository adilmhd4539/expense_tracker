import 'package:freezed_annotation/freezed_annotation.dart';

enum CategoryType {
  ///an enum that diffines the type of the expense like whether its an income or expense
  @JsonValue("INCOME")
  income,
  @JsonValue("EXPENSE")
  expense
}
