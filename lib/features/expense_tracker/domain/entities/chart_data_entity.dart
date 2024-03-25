import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_entity.dart';
part 'generated/chart_data_entity.freezed.dart';
part 'generated/chart_data_entity.g.dart';

@freezed
class ChartData with _$ChartData {
  const factory ChartData({
    required double totalAmout,
    required List<Category> categories,
  }) = _ChartData;

  factory ChartData.fromJson(Map<String, dynamic> json) =>
      _$ChartDataFromJson(json);
}
