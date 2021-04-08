import 'package:BruxAlert/pressure_stats_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'heartRate.dart';
import 'temperature.dart';
import 'hapticMotor.dart';
import 'pressure.dart';
import 'settings.dart';
import 'calendar.dart';
import 'heartRate_stats_screen.dart';
import 'temperature_stats_screen.dart';
import 'pressure_stats_screen.dart';
import 'hp_stats_screen.dart';
import 'progress.dart';
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
        textTheme: Theme.of(context).textTheme.apply(displayColor: Color(0xFF222B45)),
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key:key);
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
                        )
                    ),
                  ),
                  Text(
                    "How are you doing today?",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                  ),
                  Positioned(
                    bottom: 0,

                    child: Container(

                      height: 75.0,
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
                      child:MoodsSelector(),
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
                        DataCard(
                          title: "Heart Rate",
                          boxColor: Colors.pinkAccent,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return HRStats();
                              }),
                            );
                          },
                        ),
                        DataCard(
                          title: "Temperature",
                          boxColor: Colors.lightBlue,
                          //svgSrc: "assets/icons/Excrecises.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return TempStats();
                              }),
                            );
                          },
                        ),
                        DataCard(
                          title: "Pressure",
                          boxColor: Colors.indigoAccent,
                          //svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return PressureStats();
                              }),
                            );
                          },
                        ),
                        DataCard(
                          title: "Haptic Motor",
                          boxColor: Colors.teal,
                          // svgSrc: "assets/icons/yoga.svg",

                          //someIcon : Icon(Icons.bluetooth_audio_rounded, color: Colors.white),
                          press: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return HMStats();
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


class DataCard extends StatelessWidget {
  final String title;
  final Function press;
  final Color boxColor;
  const DataCard({
    Key key,
    this.title,
    this.press,
    this.boxColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 10,
        height: 15,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(7),
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
                        .title
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

class DataButton extends StatelessWidget {
  final int dataNum;
  final String title;
  final bool isDone;
  final Function press;
  const DataButton({
    Key key,
    this.dataNum,
    this.title,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          height: 25,
          width: constraint.maxWidth / 3 -
              30, // constraint.maxWidth provide us the available with for this widget
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
                      "$title",
                      style: Theme.of(context).textTheme.subtitle,
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
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Calendar();
                }),
              );
            },
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
            press: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
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
  const BottomNavItem({
    Key key,
    this.svgScr,
    this.title,
    this.press,
    this.isActive = false,
    this.color,
    this.icon
  }) : super(key: key);

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
}class MoodsSelector extends StatefulWidget {
  @override
  _MoodsSelectorState createState() => _MoodsSelectorState();
}

class _MoodsSelectorState extends State<MoodsSelector> {
  List<bool> isSelected = [ true,false,false,false,false];


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
