import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import './tabs.dart';

///Class to hold data for itembuilder in Withbuilder app.
class ItemData {
  final Color color;
  final String image;
  final String text1;
  final String text2;
  final String text3;

  ItemData(this.color, this.image, this.text1, this.text2, this.text3);
}

/// Example of LiquidSwipe with itemBuilder
class WithBuilder extends StatefulWidget {
  @override
  _WithBuilder createState() => _WithBuilder();
}

class _WithBuilder extends State<WithBuilder> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;
  static final style = TextStyle(
    fontSize: 30,
    fontFamily: "Billy",
    fontWeight: FontWeight.w600,
  );
  List<ItemData> data = [
    ItemData(Colors.blue, "assets/longboard.png", "Hi", "It's Me", "Sahdeep"),
    ItemData(Colors.white, "assets/satellite.png", "Take a", "Look At",
        "Liquid Swipe"),
    ItemData(Colors.green, "assets/video-camera.png", "Liked?", "Fork!",
        "Give Star!"),
    ItemData(Colors.yellow, "assets/bus.png", "Can be", "Used for",
        "Onboarding design"),
  ];

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  color: data[index].color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage(data[index].image),
                        width: 130,
                      ),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            data[index].text1,
                            style: style,
                          ),
                          Text(
                            data[index].text2,
                            style: style,
                          ),
                          Text(
                            data[index].text3,
                            style: style,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              positionSlideIcon: 0.8,
              slideIconWidget: Icon(Icons.arrow_back_ios),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              fullTransitionValue: 880,
              enableSideReveal: true,
              enableLoop: true,
              ignoreUserGestureWhileAnimating: true,
            ),
            Container(
              padding: EdgeInsets.all(40),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TabScreen()),
                      )
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    print(lpage);
    setState(() {
      page = lpage;
    });
  }
}
