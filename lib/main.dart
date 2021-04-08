import 'package:BruxAlert/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'heartRate.dart';
import 'temperature.dart';
import 'hapticMotor.dart';
import 'pressure.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter_app3/screens/details_screen.dart';
// import 'package:flutter_app3/widgets/bottom_nav_bar.dart';
// import 'flutter_app3/lib/category_card.dart';
// import 'package:flutter_app3/widgets/search_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BruxAlert',
      theme: ThemeData(
        fontFamily: "Cairo",
        textTheme:
            Theme.of(context).textTheme.apply(displayColor: Color(0xFF222B45)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.account_circle),
                          hoverColor: Colors.blue,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return SettingsScreen();
                              }),
                            );
                          },
                        )),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.bluetooth),
                          hoverColor: Colors.blue,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return SettingsScreen();
                              }),
                            );
                          },
                        )),
                  ),
                  Text(
                    "How are you doing today?",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width - 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 5.5,
                              blurRadius: 5.5,
                            )
                          ]),
                      child: MoodsSelector(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: <Widget>[
                        CategoryCard(
                          title: "Heart Rate",
                          boxColor: Colors.pinkAccent,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return HeartRateScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Temperature",
                          boxColor: Colors.lightBlue,
                          //svgSrc: "assets/icons/Excrecises.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return TemperatureScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Pressure",
                          boxColor: Colors.indigoAccent,
                          //svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return PressureScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Haptic Motor",
                          boxColor: Colors.teal,
                          // svgSrc: "assets/icons/yoga.svg",

                          //someIcon : Icon(Icons.bluetooth_audio_rounded, color: Colors.white),
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return HMotorScreen();
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final Function press;
  final Color boxColor;
  const CategoryCard({
    Key key,
    this.title,
    this.press,
    this.boxColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: Container(
        width: 20,
        height: 35,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final String seassionTitle;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key key,
    this.seassionTitle,
    this.seassionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? Colors.pinkAccent[100] : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Icon(
                        Icons.analytics_outlined,
                        color: isDone ? Colors.white : Colors.pinkAccent[100],
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "$seassionTitle",
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 70,
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            color: Colors.white,
            icon: Icons.article_outlined,
            title: "Calendar",
          ),
          BottomNavItem(
            title: "Progress",
            color: Colors.white,
            icon: Icons.analytics_outlined,
            isActive: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ChartsDemo();
                }),
              );
            },
          ),
          BottomNavItem(
            title: "Home",
            color: Colors.white,
            icon: Icons.home,
            isActive: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                }),
              );
            },
          ),
          BottomNavItem(
            title: "Settings",
            color: Colors.white,
            icon: Icons.settings,
            isActive: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SettingsScreen();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          //icon: SvgPicture.asset("assets/icons/search.svg"),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final Function press;
  final bool isActive;
  final Color color;
  final IconData icon;
  const BottomNavItem(
      {Key key,
      this.svgScr,
      this.title,
      this.press,
      this.isActive = false,
      this.color,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}

class MoodsSelector extends StatefulWidget {
  @override
  _MoodsSelectorState createState() => _MoodsSelectorState();
}

class _MoodsSelectorState extends State<MoodsSelector> {
  List<bool> isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        selectedColor: Colors.purple,
        borderColor: Colors.transparent,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: <Widget>[
          Icon(
            Icons.sentiment_very_dissatisfied,
            size: 36,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.sentiment_dissatisfied,
              size: 36,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.sentiment_neutral,
              size: 36,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.sentiment_satisfied,
              size: 36,
            ),
          ),
          Icon(
            Icons.sentiment_very_satisfied,
            size: 36,
          ),
        ],
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            isSelected[index] = !isSelected[index];
          });
        },
      ),
    );
  }
}

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
      padding: const EdgeInsets.all(10),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("CLENCHES FOR THIS WEEK"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.pink,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
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
