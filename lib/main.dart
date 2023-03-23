import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() => runApp(const MaterialApp(home: GaugeCompassExample()));

class GaugeCompassExample extends StatefulWidget {
  const GaugeCompassExample({Key? key}) : super(key: key);

  @override
  State<GaugeCompassExample> createState() => _GaugeCompassExampleState();
}

class _GaugeCompassExampleState extends State<GaugeCompassExample> {
  double _annotationTextSize = 22;
  double _positionFactor = 0.025;
  double _markerHeight = 10;
  double _markerWidth = 15;
  double _markerOffset = 0.71;
  double _labelFontSize = 10;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery
        .of(context)
        .orientation == Orientation.portrait) {
      _annotationTextSize = 22;
      _markerOffset = 0.71;
      _positionFactor = 0.025;
      _markerHeight = 10;
      _markerWidth = 15;
      _labelFontSize = 10;
    } else {
      _annotationTextSize = 16;
      _markerOffset = 0.69;
      _positionFactor = 0.05;
      _markerHeight = 5;
      _markerWidth = 10;
      _labelFontSize = 10;
    }
    final Widget widget = SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          showAxisLine: false,
          radiusFactor: 1,
          canRotateLabels: true,
          tickOffset: 0.32,
          offsetUnit: GaugeSizeUnit.factor,
          onLabelCreated: _handleAxisLabelCreated,
          startAngle: 270,
          endAngle: 270,
          labelOffset: 0.05,
          maximum: 360,
          interval: 30,
          minorTicksPerInterval: 4,
          axisLabelStyle: GaugeTextStyle(
              color: Color(0xFF949494), fontSize: _labelFontSize
          ),
          minorTickStyle: const MinorTickStyle(
              color: Color(0xFF616161),
              thickness: 1.6,
              length: 0.058,
              lengthUnit: GaugeSizeUnit.factor
          ),
          majorTickStyle: const MajorTickStyle(
              color: Color(0xFF949494),
              thickness: 2.3,
              length: 0.087,
              lengthUnit: GaugeSizeUnit.factor
          ),
          //backgroundImage: const AssetImage('assets/images/dark_theme_gauge.png'),
          pointers: <GaugePointer>[
            MarkerPointer(
              value: 90,
              color: const Color(0xFFDF5F2D),
              enableAnimation: true,
              animationDuration: 1200,
              markerOffset: _markerOffset,
              offsetUnit: GaugeSizeUnit.factor,
              markerType: MarkerType.triangle,
              markerHeight: _markerHeight,
              markerWidth: _markerWidth,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 270,
              positionFactor: _positionFactor,
              widget: Text(
                '90', style: TextStyle(color: const Color(0xFFDF5F2D),
                  fontWeight: FontWeight.bold,
                  fontSize: _annotationTextSize),
              ),
            )
          ],
        )
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget,
    );
  }

  void _handleAxisLabelCreated(AxisLabelCreatedArgs args) {
    if (args.text == '90') {
      args.text = 'E';
      args.labelStyle = GaugeTextStyle(
        color: const Color(0xFFDF5F2D),
        fontSize: _labelFontSize,
      );
    } else if (args.text == '360') {
      args.text = '';
    } else {
      if (args.text == '0') {
        args.text = 'N';
      } else if (args.text == '180') {
        args.text = 'S';
      } else if (args.text == '270') {
        args.text = 'W';
      }

      args.labelStyle = GaugeTextStyle(color: const Color(0xFFFFFFFF), fontSize: _labelFontSize);
    }
  }

}
