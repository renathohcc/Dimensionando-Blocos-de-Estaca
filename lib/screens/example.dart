import 'package:flutter/material.dart';
import 'package:dim_blocos/constants.dart';

class PileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Medidas do Bloco",
            style: TextStyle(
                color: whiteColor, fontFamily: "RobotoMono", fontSize: 20.0),
          ),
          backgroundColor: lightBlue,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 1.0),
              child: Image.asset(
                "assets/images/bloco_estaca.png",
                width: 300.0,
                height: 250.0,
              ),
            ),
            _buildText("\"L\" é a distância entre os centros das estacas."),
            _buildText(
                "\"A\" é a distância entre o centro da estaca e a borda do bloco."),
            _buildText("\"B\" é a largura do bloco."),
          ],
        ));
  }

  Widget _buildText(String text) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
            color: darkBlue, fontFamily: "RobotoMono", fontSize: 13.5),
      ),
    );
  }
}
