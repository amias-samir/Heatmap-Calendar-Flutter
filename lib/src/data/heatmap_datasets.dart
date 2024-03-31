import 'children_item_datasets.dart';

class HeatmapData {

  const HeatmapData({ this.intensity=0, this.heatMapChildren});

  ///The [intensity]  is used to show the intensity level of the event in the heatmap.
  final int? intensity;

  ///The [heatMapChildren]  is used to show the multiple actions on the same date in the heatmap.
  final List<HeatmapChildrenData>? heatMapChildren;


}


