import 'package:flutter/material.dart';
import 'package:vpnui/utils.dart';

import 'custom_clipper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: ListView(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                upperCurvedContainer(context),
                circularButtonWidget(context),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .4,
            ),
            connectedStatusText(),
            SizedBox(
              height: MediaQuery.of(context).size.width * .1,
            ),
            locationCard()
          ],
        ));
  }

  Widget locationCard() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Random Location",
              style: locationTitleStyle,
            ),
            SizedBox(
              height: 14.0,
            ),
            Container(
                height: MediaQuery.of(context).size.height * .1,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Color(0xFF9BB18D),
                        style: BorderStyle.solid,
                        width: .5),
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.0,
                      backgroundImage: NetworkImage(kenyaFlagUrl),
                    ),
                    title: Text(
                      "Kenya",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(Icons.refresh , color: Colors.white70, size: 18.0,),
                  ),
                ))
          ]),
    );
  }

  Widget connectedStatusText() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(style: connectedStyle, text: "Status : ", children: [
          TextSpan(text: " Connected\n", style: connectedGreenStyle),
          TextSpan(text: "00:32:21", style: connectedSubtitle)
        ]),
      ),
    );
  }

  Widget upperCurvedContainer(BuildContext context) {
    return ClipPath(
      clipper: myCustomClipper(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),
        height: MediaQuery.of(context).size.height * .41,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: curveGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _topRow(),
            Text(
              "SateLite VPN",
              style: vpnStyle,
            ),
            _bottomRow(),
          ],
        ),
      ),
    );
  }

  Widget _topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          height: MediaQuery.of(context).size.height * .07,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/premiumcrown.png",
                height: 36.0,
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Go Premium",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .075,
          width: MediaQuery.of(context).size.width * .125,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: Center(
            child: Icon(
              Icons.tune,
              size: 26.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _bottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Upload\n325 kb/s ",
          style: txtSpeedStyle,
        ),
        Text(
          "Download\n32 mb/s ",
          style: txtSpeedStyle,
        ),
      ],
    );
  }

  Widget circularButtonWidget(BuildContext context) {
    return Positioned(
      bottom: -MediaQuery.of(context).size.width * .36,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width * .51,
            width: MediaQuery.of(context).size.width * .51,
            decoration:
                BoxDecoration(shape: BoxShape.circle, gradient: curveGradient),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.width * .4,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: bgColor),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.width * .3,
                    width: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: greenGradient,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF00D58D).withOpacity(.2),
                              spreadRadius: 15.0,
                              blurRadius: 15.0),
                        ]),
                    child: Center(
                      child: Icon(
                        Icons.wifi_lock,
                        size: 60.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 8.0,
            top: 30.0,
            child: Container(
              height: 60.0,
              width: 60.0,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(kenyaFlagUrl),
                  radius: 40.0,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
