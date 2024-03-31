import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:heatmap_calendar_flutter/heatmap_calendar_flutter.dart';

class HeatMapCalendarExample extends StatefulWidget {
  const HeatMapCalendarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeatMapCalendarExample();
}

class _HeatMapCalendarExample extends State<HeatMapCalendarExample> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController heatLevelController = TextEditingController();

  bool isOpacityMode = true;

  Map<DateTime, HeatmapData> heatMapDatasets = {};

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    heatLevelController.dispose();
  }

  Widget _textField(final String hint, final TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20, top: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1.0)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF20bca4), width: 1.0)),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          isDense: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heatmap Calendar'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(20),
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(20),

                // HeatMapCalendar
                child: HeatMapCalendar(
                  flexible: true,
                  datasets: heatMapDatasets,
                  heatmapType: HeatmapCalendarType.widgets,
                  colorMode:
                      isOpacityMode ? ColorMode.opacity : ColorMode.color,
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

                  onClick: (datetime, heatmapData){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$datetime : $heatmapData')));
                  },
                ),
              ),
            ),
            _textField('YYYYMMDD', dateController),
            _textField('Heat Level', heatLevelController),
            ElevatedButton(
              child: const Text('COMMIT'),
              onPressed: () {
                setState(() {
                  heatMapDatasets[DateTime.parse(dateController.text)] =
                      HeatmapData(intensity: int.parse(heatLevelController.text),
                          heatMapChildren:[
                            HeatmapChildrenData(label: "label1", desc: "desc1", child: const Icon(Icons.fire_extinguisher, size: 12, color: Colors.amber,)),
                            HeatmapChildrenData(label: "label2", desc: "desc2", child: const Icon(Icons.water, size: 12, color: Colors.deepPurple,)),
                            HeatmapChildrenData(label: "label3", desc: "desc3", child: const Icon(Icons.flood, size: 12, color: Colors.blue,)),
                          ] );
                });
              },
            ),

            // ColorMode/OpacityMode Switch.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Color Mode'),
                CupertinoSwitch(
                  value: isOpacityMode,
                  onChanged: (value) {
                    setState(() {
                      isOpacityMode = value;
                    });
                  },
                ),
                const Text('Opacity Mode'),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
