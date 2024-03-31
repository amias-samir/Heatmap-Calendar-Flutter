import 'package:flutter/material.dart';
import 'package:heatmap_calendar_flutter/src/data/heatmap_datasets.dart';
import './date_util.dart';

class DatasetsUtil {
  /// Filtering [datasets] where the key is on the same month of [referenceDate].
  static Map<DateTime, HeatmapData> filterMonth(
      Map<DateTime, HeatmapData>? datasets, DateTime referenceDate) {
    return Map.from(datasets ?? {})
      ..removeWhere(
        (date, value) =>
            !(date.isAfter(DateUtil.startDayOfMonth(referenceDate)) &&
                    date.isBefore(DateUtil.endDayOfMonth(referenceDate)) ||
                date == DateUtil.endDayOfMonth(referenceDate) ||
                date == DateUtil.startDayOfMonth(referenceDate)),
      );
  }

  /// Get maximum value of [datasets].
  static int getMaxValue(Map<DateTime, HeatmapData>? datasets) {
    int result = 0;

    datasets?.forEach((date, value) {
      if (value.intensity != null && value.intensity! > result) {
        result = value.intensity!;
      }
    });

    return result;
  }

  /// Get color from [colorsets] using [dataValue].
  static Color? getColor(Map<int, Color>? colorsets, int? dataValue) {
    int result = 0;

    colorsets?.forEach((key, value) {
      if (key <= (dataValue ?? 0)) result = key;
    });

    return colorsets?[result];
  }
}
