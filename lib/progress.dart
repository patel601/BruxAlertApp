import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:BruxAlert/pressure_stats_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
class ChartsDemo extends StatefulWidget {
  //
  ChartsDemo() : super();

  final String title = "Progress per day";

  @override
  ChartsDemoState createState() => ChartsDemoState();
}

class ChartsDemoState extends State<ChartsDemo> {
  //
  List<charts.Series> seriesList;

  static List<charts.Series<Progress, String>> _createRandomData() {
    final random = Random();

    final progressDay = [
      Progress('Monday', random.nextInt(100)),
      Progress('Tuesday', random.nextInt(100)),
      Progress('Wednesday', random.nextInt(100)),
      Progress('Thursday', random.nextInt(100)),
      Progress('Friday', random.nextInt(100)),
      Progress('Saturday', random.nextInt(100)),
      Progress('Sunday', random.nextInt(100)),
    ];

    final tabletProgressData = [
      Progress('Monday', random.nextInt(100)),
      Progress('Tuesday', random.nextInt(100)),
      Progress('Wednesday', random.nextInt(100)),
      Progress('Thursday', random.nextInt(100)),
      Progress('Friday', random.nextInt(100)),
      Progress('Saturday', random.nextInt(100)),
      Progress('Sunday', random.nextInt(100)),
    ];

    final mobileProgessData = [
      Progress('Monday', random.nextInt(100)),
      Progress('Tuesday', random.nextInt(100)),
      Progress('Wednesday', random.nextInt(100)),
      Progress('Thursday', random.nextInt(100)),
      Progress('Friday', random.nextInt(100)),
    ];

    return [
      charts.Series<Progress, String>(
        id: 'Progress',
        domainFn: (Progress progress, _) => progress.day,
        measureFn: (Progress progress, _) => progress.clenches,
        data: progressDay,
        fillColorFn: (Progress progress, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      ),
      // charts.Series<Progress, String>(
      //   id: 'Progress',
      //   domainFn: (Progress progress, _) => progress.day,
      //   measureFn: (Progress progress, _) => progress.clenches,
      //   data: tabletProgressData,
      //   fillColorFn: (Progress progress, _) {
      //     return charts.MaterialPalette.green.shadeDefault;
      //   },
      // ),
      // charts.Series<Progress, String>(
      //   id: 'PROGRESS',
      //   domainFn: (Progress progress, _) => progress.day,
      //   measureFn: (Progress progress, _) => progress.clenches,
      //   data: mobileProgessData,
      //   fillColorFn: (Progress progress, _) {
      //     return charts.MaterialPalette.teal.shadeDefault;
      //   },
      // )
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 2.0,
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    Padding(
      padding: const EdgeInsets.all(4),
    );
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        title: Text("CLENCHES FOR THIS WEEK"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.pink,
      ),
      body: Container(
        padding: EdgeInsets.all(4),
        child: barChart(),
      ),
    );
  }
}
// Text(
//   "See how many clenches you did for today!",
//   style: Theme.of(context)
//       .textTheme
//       .headline4
//       .copyWith(fontWeight: FontWeight.w900),
// );
class Progress {
  final String day;
  final int clenches;

  Progress(this.day, this.clenches);
}