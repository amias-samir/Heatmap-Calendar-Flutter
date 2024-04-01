import 'package:flutter/material.dart';
import 'package:heatmap_calendar_flutter/heatmap_calendar_flutter.dart';
import 'package:heatmap_calendar_flutter/src/data/children_item_datasets.dart';
import '../data/heatmap_color.dart';

class HeatMapContainer extends StatelessWidget {
  final DateTime date;
  final HeatmapData? heatmapData;
  final HeatmapCalendarType? heatmapType;
  final double? size;
  final double? fontSize;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? textColor;
  final EdgeInsets? margin;
  final bool? showText;
  final Function(DateTime dateTime, HeatmapData heatmapData)? onClick;

  const HeatMapContainer({
    Key? key,
    required this.date,
    required this.heatmapType,
    this.heatmapData,
    this.margin,
    this.size,
    this.fontSize,
    this.borderRadius,
    this.backgroundColor,
    this.selectedColor,
    this.textColor,
    this.onClick,
    this.showText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(2),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? HeatMapColor.defaultColor,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5)),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOutQuad,
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: heatmapType == HeatmapCalendarType.widgets ?Colors.transparent :selectedColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 5)),
            ),
            child: (showText ?? true) ? (
            heatmapType == HeatmapCalendarType.widgets ?
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _widgetsFromData(heatmapData),

                Align(
                  alignment: Alignment.bottomCenter,
                  child:  Text(
                    date.day.toString(),
                    style: TextStyle(
                        color: textColor ?? const Color(0xFF8A8A8A),
                        fontSize: fontSize),
                  ),
                )
              ],
            ): Text(
                    date.day.toString(),
                    style: TextStyle(
                        color: textColor ?? const Color(0xFF8A8A8A),
                        fontSize: fontSize),
                  )
            )
                : null,
          ),
        ),
        onTap: () {
          onClick != null ? onClick!(date, heatmapData?? const HeatmapData()) : null;
        },
      ),
    );
  }

  _widgetsFromData(HeatmapData? heatmapData){

    if(heatmapData != null && heatmapData.heatMapChildren != null && heatmapData.heatMapChildren!.isNotEmpty ) {
      if(heatmapData.heatMapChildren!.length > 2){
        return _overlappedUI(heatmapData);
      }

      if(heatmapData.heatMapChildren!.length == 1){
        return SizedBox(
          height: 20.0, width: 20.0, child: heatmapData.heatMapChildren![0].child,
        );
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [... heatmapData.heatMapChildren!.map((childWidget) => childWidget.child).toList()
        ],
      );
    }

    return const SizedBox();
  }

  Widget _overlappedUI(HeatmapData heatmapData) {
    const overlap = 10.0;
    final items = [... heatmapData.heatMapChildren!.map((childWidget) => childWidget.child).toList()
    ];

    List<Widget> stackLayers = List<Widget>.generate(items.length, (index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
        child: items[index],
      );
    });

    return Stack(children: stackLayers);
  }
}
