import 'package:flutter/material.dart';
import 'package:heatmap_calendar_flutter/src/data/heatmap_datasets.dart';
import '../heatmap_calendar_flutter.dart';
import './widgets/heatmap_page.dart';
import './widgets/heatmap_color_tip.dart';
import './enums/heatmap_color_mode.dart';
import './utils/date_util.dart';

class HeatMap extends StatefulWidget {
  /// The Date value of start day of heatmap.
  ///
  /// HeatMap shows the start day of [startDate]'s week.
  ///
  /// Default value is 1 year before of the [endDate].
  /// And if [endDate] is null, then set 1 year before of the [DateTime.now].
  final DateTime? startDate;

  /// The Date value of end day of heatmap.
  ///
  /// Default value is [DateTime.now].
  final DateTime? endDate;

  /// The datasets which fill blocks based on its value.
  final Map<DateTime, HeatmapData>? datasets;

  /// The color value of every block's default color.
  final Color? defaultColor;

  /// The text color value of every blocks.
  final Color? textColor;

  /// The double value of every block's size.
  final double? size;

  /// The double value of every block's fontSize.
  final double? fontSize;

  /// The colorsets which give the color value for its thresholds key value.
  ///
  /// Be aware that first Color is the maximum value if [ColorMode] is [ColorMode.opacity].
  /// Also colorsets must have at least one color.
  final Map<int, Color> colorsets;

  /// ColorMode changes the color mode of blocks.
  ///
  /// [ColorMode.opacity] requires just one colorsets value and changes color
  /// dynamically based on hightest value of [datasets].
  /// [ColorMode.color] changes colors based on [colorsets] thresholds key value.
  ///
  /// Default value is [ColorMode.opacity].
  final ColorMode colorMode;

  /// HeatmapCalendarType changes the UI mode of blocks.
  ///
  /// [HeatmapCalendarType.intensity] requires just the intensity value to change the color
  /// dynamically based on hightest value of [datasets].
  /// [HeatmapCalendarType.widgets] requires the list of widgets (list of events/activities) on the same date.
  ///
  /// Default value is [HeatmapCalendarType.intensity].
  final HeatmapCalendarType heatmapType;

  /// Show widget legends of the heatmap if [HeatmapCalendarType] is [HeatmapCalendarType.widgets] at the below.
  final List<HeatmapChildrenData>? heatmapWidgetLegends;

  /// Function that will be called when a block is clicked.
  ///
  /// Parameter gives clicked [DateTime] value.
  final Function(DateTime, HeatmapData)? onClick;

  /// The margin value for every block.
  final EdgeInsets? margin;

  /// The double value of every block's borderRadius.
  final double? borderRadius;

  /// Show day text in every blocks if the value is true.
  ///
  /// Default value is false.
  final bool? showText;

  /// Show color tip which represents the color range at the below.
  ///
  /// Default value is true.
  final bool? showColorTip;

  /// Makes heatmap scrollable if the value is true.
  ///
  /// default value is false.
  final bool scrollable;

  /// Widgets which shown at left and right side of colorTip.
  ///
  /// First value is the left side widget and second value is the right side widget.
  /// Be aware that [colorTipHelper.length] have to greater or equal to 2.
  /// Give null value makes default 'less' and 'more' [Text].
  final List<Widget?>? colorTipHelper;

  /// The integer value which represents the number of [HeatMapColorTip]'s tip container.
  final int? colorTipCount;

  /// The double value of [HeatMapColorTip]'s tip container's size.
  final double? colorTipSize;

  const HeatMap({
    Key? key,
    required this.colorsets,
    this.colorMode = ColorMode.opacity,
    this.heatmapType = HeatmapCalendarType.intensity,
    this.heatmapWidgetLegends,
    this.startDate,
    this.endDate,
    this.textColor,
    this.size = 20,
    this.fontSize,
    this.onClick,
    this.margin,
    this.borderRadius,
    this.datasets,
    this.defaultColor,
    this.showText = false,
    this.showColorTip = true,
    this.scrollable = false,
    this.colorTipHelper,
    this.colorTipCount,
    this.colorTipSize,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeatMap();
}

class _HeatMap extends State<HeatMap> {
  /// Put child into [SingleChildScrollView] so that user can scroll the widet horizontally.
  Widget _scrollableHeatMap(Widget child) {
    return widget.scrollable
        ? SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: child,
          )
        : child;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Heatmap Widget.
        _scrollableHeatMap(HeatMapPage(
          endDate: widget.endDate ?? DateTime.now(),
          startDate: widget.startDate ??
              DateUtil.oneYearBefore(widget.endDate ?? DateTime.now()),
          colorMode: widget.colorMode,
          heatmapType: widget.heatmapType,
          size: widget.size,
          fontSize: widget.fontSize,
          datasets: widget.datasets,
          defaultColor: widget.defaultColor,
          textColor: widget.textColor,
          colorsets: widget.colorsets,
          borderRadius: widget.borderRadius,
          onClick: widget.onClick,
          margin: widget.margin,
          showText: widget.showText,
        )),

        // Show HeatMapColorTip if showColorTip is true.
        if (widget.showColorTip == true)
          HeatMapColorTip(
            colorMode: widget.colorMode,
            heatmapType: widget.heatmapType,
            heatmapWidgetLegends: widget.heatmapWidgetLegends,
            colorsets: widget.colorsets,
            leftWidget: widget.colorTipHelper?[0],
            rightWidget: widget.colorTipHelper?[1],
            containerCount: widget.colorTipCount,
            size: widget.colorTipSize,
          ),
      ],
    );
  }
}
