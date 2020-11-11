import 'package:dim_blocos/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:dim_blocos/constants.dart';

// ignore: must_be_immutable
class DimPage extends StatefulWidget {
  TextEditingController _fykController;
  TextEditingController _loadController;
  TextEditingController _alturaUtilController;
  double _medL;
  double _medPilar;

  DimPage(this._fykController, this._loadController, this._alturaUtilController,
      this._medL, this._medPilar);

  @override
  _DimPageState createState() => _DimPageState();
}

class _DimPageState extends State<DimPage> {
  String _textTF = "";
  String _textSA = "";
  String _textTF2 = "";
  String _textSA2 = "";

  void _calculateDim() {
    setState(() {
      double _load = double.parse(widget._loadController.text);
      double _altUtil = double.parse(widget._alturaUtilController.text);
      double _fyk = double.parse(widget._fykController.text);

      double _product1 = _load * 1.4 / (2 * 0.9 * _altUtil);
      double _product2 = (widget._medL / 2) - (widget._medPilar / 4);

      double _tractiveForce = _product1 * _product2;
      double _fyd = _fyk / 1.15;

      double _steelArea = _tractiveForce / _fyd;

      _textTF = "A força de tração no tirante é:";
      _textSA = "A área de aço da armadura principal é:";

      _textTF2 = "${_tractiveForce.toStringAsPrecision(5)} kN";
      _textSA2 = "${_steelArea.toStringAsPrecision(3)} CM²";

      print(widget._medL);
      print(widget._medPilar);
      print(_product1);
      print(_product2);
    });
  }

  @override
  void initState() {
    super.initState();

    _calculateDim();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resultados",
          style: TextStyle(
              color: whiteColor, fontFamily: "RobotoMono", fontSize: 20.0),
        ),
        backgroundColor: lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: _buildMinText(_textTF),
            ),
            _buildMinText2(_textTF2),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: _buildMinText(_textSA),
            ),
            _buildMinText2(_textSA2),
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Container(
                child: RaisedButton(
                  color: lightBlue,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => StartScreen()));
                  },
                  child: Text(
                    "CALCULAR NOVO BLOCO",
                    style: TextStyle(
                        color: whiteColor,
                        fontFamily: "RobotoMono",
                        fontSize: 12.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMinText(String text) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            color: darkBlue, fontFamily: "RobotoMono", fontSize: 15.0),
      ),
    );
  }

  Widget _buildMinText2(String text) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontFamily: "RobotoMono",
            fontSize: 22.0),
      ),
    );
  }
}
