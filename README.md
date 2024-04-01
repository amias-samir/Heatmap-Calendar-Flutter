# Heatmap Calendar Flutter

Heatmap Calendar Flutter is inspired by the GitHub contribution chart and Flutter Heatmap Calendar.

Flutter Heatmap Calendar provides a traditional contribution chart called `HeatMap` and a calendar version of it called `HeatMapCalendar`.

<p float="left">
  <img src="https://github.com/amias-samir/Heatmap-Calendar-Flutter/assets/17323912/b25338aa-6564-428a-8d50-132301f81262" width="220" />
  <img src="https://github.com/amias-samir/Heatmap-Calendar-Flutter/assets/17323912/d25c9a4a-2035-40a4-9ddd-220463a0d09d" width="220" />
  <img src="https://github.com/amias-samir/Heatmap-Calendar-Flutter/assets/17323912/4815817d-5046-4ec8-b468-2d7ce2734926" width="220" /> 
  <img src="https://github.com/amias-samir/Heatmap-Calendar-Flutter/assets/17323912/60f81256-8dbd-4b0e-a1b6-b30717370eee" width="220" />
</p>

<p float="left">
  <img src="https://github.com/amias-samir/Heatmap-Calendar-Flutter/assets/17323912/e50b7eaa-82dc-49f3-9f79-928fde18f07c" width="220" />
  <img src="https://github.com/amias-samir/Heatmap-Calendar-Flutter/assets/17323912/031e7551-2078-4ed9-a524-918f5d5b9fcc" width="220" />
</p>




## Getting started

### Depend on it.


Add the below line to your personal package's `pubspec.yaml`.

```yaml
dependencies:
  maplibre_gl:
    git:
      url: https://github.com/amias-samir/Heatmap-Calendar-Flutter.git
      ref: master
```

And run `flutter pub get` to install.

### Import it.

```dart
import 'package:flutter_heatmap_calendar/heatmap_calendar_flutter.dart';
```

## Props

### HeatMap

<!-- prettier-ignore -->
|Props|Types|Default|Description|
|-|-|-|-|
|startDate|`DateTime?`|1 year before of the `endDate`|Start date of `HeatMap`.|
|endDate|`DateTime?`|Today<br>( `DateTime.now()` )|Last day of `HeatMap`.|
|datasets|`Map<DateTime, HeatmapData>?`|`null`|Sets of data which to be displayed.|
|colorsets|`Map<int, Color>`|required|Sets of color values for its thresholds key value.<br>At least one Color is required.<br>Be aware that only first color will be used if `ColorMode` is `ColorMode.opacity`.|
|defaultColor|`Color?`|![#F8F9FA](https://via.placeholder.com/15/F8F9FA/000000?text=+) `Color(0xFFF8F9FA)`|Default color of every block.|
|textColor|`Color?`|![#8A8A8A](https://via.placeholder.com/15/8A8A8A/000000?text=+) `Color(0xFF8A8A8A)`|Color value of every text.|
|colorMode|`ColorMode`|`ColorMode.opacity`|`ColorMode.opacity` requires just one colorsets value and changes color dynamically based on hightest value of `datasets`.<br>`ColorMode.color` changes colors based on `colorsets` thresholds key value.|
|size|`double?`|`20`|The size of every block.|
|fontSize|`double?`|`null`|The size of every text.|
|onClick|`Function(DateTime, HeatMapData)?`|`null`|Callback function which will be called if user clicks the block.|
|margin|`EdgeInsets?`|`EdgeInsets.all(2)`|The margin value of block.|
|borderRadius|`double?`|`5`|Border radius value of block.|
|scrollable|`bool`|`false`|Make `HeatMap` scrollable if `scrollable` is `true`.|
|showText|`bool?`|`false`|Show day text in every block if `showText` is `true`.|
|showColorTip|`bool?`|`true`|Show color tip if `showColorTip` is `true`.|
|colorTipHelper|`List<Widget?>?`|`null`|Widgets which are shown at left and right side of `colorTip`.<br>First value is the left side widget and second value is the right side widget.<br>Give null value makes default 'less' and 'more' text.|
|colorTipCount|`int?`|`7`|Length of `colorTip` block.|
|colorTipSize|`double?`|`10`|The size of `colorTip`.|

### HeatMapCalendar

<!-- prettier-ignore -->
|Props|Types|Default|Description|
|-|-|---|-|
|initDate|`DateTime?`|Today<br>( `DateTime.now()` )|Initialized Year/Month value of `HeatMapCalendar`.|
|datasets|`Map<DateTime, HeatmapData>?`|`null`|Sets of data which to be displayed.|
|heatmapType|`HeatmapCalendarType`|`HeatmapCalendarType.intensity`|`HeatmapCalendarType.intensity` requires just one colorsets and `intensity` of `HeatmapData`  and changes color dynamically based on hightest value of `datasets`.<br>`HeatmapCalendarType.widgets` changes widgets based on `HeatmapData.heatMapChildren` .|
|heatmapChildrenData|`HeatmapChildrenData?`|`null`|Sets of child widget data which to be displayed.|
|heatmapWidgetLegends|`List<HeatmapChildrenData>`|`null`|Sets of legend widget data which to be displayed. It is required if `heatmapType` is `HeatmapCalendarType.widgets` |
|colorsets|`Map<int, Color>`|required|Sets of color values for its thresholds key value.<br>At least one Color is required.<br>Be aware that only first color will be used if `ColorMode` is `ColorMode.opacity`.|
|defaultColor|`Color?`|![#F8F9FA](https://via.placeholder.com/15/F8F9FA/000000?text=+) `Color(0xFFF8F9FA)`|Default color of every block.|
|textColor|`Color?`|![#8A8A8A](https://via.placeholder.com/15/8A8A8A/000000?text=+) `Color(0xFF8A8A8A)`|Color value of every text.|
|colorMode|`ColorMode`|`ColorMode.opacity`|`ColorMode.opacity` requires just one colorsets value and changes color dynamically based on hightest value of `datasets`.<br>`ColorMode.color` changes colors based on `colorsets` thresholds key value.|
|size|`double?`|`42`|The size of every block.|
|fontSize|`double?`|`null`|The size of every text.|
|monthFontSize|`double?`|`12`|The size of month label.|
|weekFontSize|`double?`|`12`|The size of week label.|
|weekTextColor|`Color?`|![#758EA1](https://via.placeholder.com/15/758EA1/000000?text=+) `Color(0xFF758EA1)`|Default color of every block.|Color value of week label.|
|onClick|`Function(DateTime, HeatMapData)?`|`null`|Callback function which will be called if user clicks the block.|
|margin|`EdgeInsets`|`EdgeInsets.all(2)`|The margin value of block.|
|borderRadius|`double?`|`5`|Border radius value of block.|
|flexible|`bool?`|`false`|Makes `HeatMapCalendar`'s size dynamically fit on screen.<br>If `flexible` is `true` then, `size` props will be ignored.|
|showColorTip|`bool?`|`true`|Show color tip if `showColorTip` is `true`.|
|colorTipHelper|`List<Widget?>?`|`null`|Widgets which are shown at left and right side of `colorTip`.<br>First value is the left side widget and second value is the right side widget.<br>Give null value makes default 'less' and 'more' text.|
|colorTipCount|`int?`|`7`|Length of `colorTip` block.|
|colorTipSize|`double?`|`10`|The size of `colorTip`.|

## Example

### HeatMap

```dart
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
...
HeatMap(
  datasets: {
    DateTime(2024, 1, 6): HeatmapData(intensity: 1),
    DateTime(2024, 4, 7): HeatmapData(intensity: 7),
    DateTime(2024, 4, 8): HeatmapData(intensity: 10),
    DateTime(2024, 4, 9): HeatmapData(intensity: 13),
    DateTime(2024, 4, 13): HeatmapData(intensity: 6),
  },
  colorMode: ColorMode.opacity,
  showText: false,
  scrollable: true,
  colorsets: {
    1: Colors.red,
    3: Colors.orange,
    5: Colors.yellow,
    7: Colors.green,
    9: Colors.blue,
    11: Colors.indigo,
    13: Colors.purple,
  },
  onClick: (datetime, heatmapdata) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
  },
);
```

### HeatMapCalendar (Intensity)

```dart
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
...
HeatMapCalendar(
  defaultColor: Colors.white,
  flexible: true,
  colorMode: ColorMode.opacity,
  heatmapType: HeatmapCalendarType.intensity,
  datasets: {
    DateTime(2024, 1, 6): HeatmapData(intensity: 1),
    DateTime(2024, 4, 7): HeatmapData(intensity: 7),
    DateTime(2024, 4, 8): HeatmapData(intensity: 10),
    DateTime(2024, 4, 9): HeatmapData(intensity: 13),
    DateTime(2024, 4, 13): HeatmapData(intensity: 6),
  },
  colorsets: const {
    1: Colors.red,
    3: Colors.orange,
    5: Colors.yellow,
    7: Colors.green,
    9: Colors.blue,
    11: Colors.indigo,
    13: Colors.purple,
  },
  onClick: (datetime, heatmapdata) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
  },
);
```

### HeatMapCalendar (Widgets)

```dart
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
...
HeatMapCalendar(
  defaultColor: Colors.white,
  flexible: true,
  colorMode: ColorMode.opacity,
  heatmapType: HeatmapCalendarType.widgets,
  datasets: {
    DateTime(2024, 04, 01): HeatmapData(intensity: 1, heatMapChildren: [
        HeatmapChildrenData(label: "label1", desc: "desc1", child: const Icon(Icons.fire_extinguisher, size: 20, color: Colors.amber,)),
  ]),

    DateTime(2024, 04, 05): HeatmapData(intensity: 1, heatMapChildren: [
      HeatmapChildrenData(label: "label1", desc: "desc1", child: const Icon(Icons.fire_extinguisher, size: 20, color: Colors.amber,)),
      HeatmapChildrenData(label: "label2", desc: "desc2", child: const Icon(Icons.water, size: 20, color: Colors.deepPurple,)),
    ]),

    DateTime(2024, 04, 12): HeatmapData(intensity: 1, heatMapChildren: [
      HeatmapChildrenData(label: "label1", desc: "desc1", child: const Icon(Icons.fire_extinguisher, size: 20, color: Colors.amber,)),
      HeatmapChildrenData(label: "label2", desc: "desc2", child: const Icon(Icons.water, size: 20, color: Colors.deepPurple,)),
      HeatmapChildrenData(label: "label3", desc: "desc3", child: const Icon(Icons.flood, size: 20, color: Colors.blue,)),
    ]),
  },
  colorsets: const {
    1: Colors.red,
    3: Colors.orange,
    5: Colors.yellow,
    7: Colors.green,
    9: Colors.blue,
    11: Colors.indigo,
    13: Colors.purple,
  },
heatmapWidgetLegends: [
  HeatmapChildrenData(label: "label1", desc: "desc1", child: const Icon(Icons.fire_extinguisher, size: 12, color: Colors.amber,)),
  HeatmapChildrenData(label: "label2", desc: "desc2", child: const Icon(Icons.water, size: 12, color: Colors.deepPurple,)),
  HeatmapChildrenData(label: "label3", desc: "desc3", child: const Icon(Icons.flood, size: 12, color: Colors.blue,)),
  HeatmapChildrenData(label: "label1", desc: "desc1", child: const Icon(Icons.fire_extinguisher, size: 12, color: Colors.amber,)),
],
  onClick: (datetime, heatmapdata) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
  },
);
```

## License

```
MIT License

Copyright (c) 2024 Samir Dangal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
