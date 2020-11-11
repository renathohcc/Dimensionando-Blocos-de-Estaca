import 'package:dim_blocos/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:dim_blocos/constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Image.asset(
              "assets/images/logo.png",
              width: 200.0,
              height: 207.0,
              alignment: Alignment.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.0),
            child: Text(
              "Dimensione blocos sobre duas estacas utilizando o método de Blevot & Fremy.",
              style: TextStyle(
                  fontFamily: "RobotoMono",
                  color: darkBlue,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 200.0),
              child: Container(
                width: 190.0,
                height: 45.0,
                child: RaisedButton(
                    textColor: whiteColor,
                    color: lightBlue,
                    child: Text(
                      "Comece a calcular",
                      style:
                          TextStyle(fontSize: 12.0, fontFamily: "RobotoMono"),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  StartScreen()));
                    }),
              ))
        ],
      ),
    );
  }
}
