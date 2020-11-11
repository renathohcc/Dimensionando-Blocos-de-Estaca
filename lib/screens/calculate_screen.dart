import 'package:dim_blocos/screens/dim_screen.dart';
import 'package:flutter/material.dart';
import 'package:dim_blocos/constants.dart';
import 'dart:math';

// ignore: must_be_immutable
class CalculatePage extends StatefulWidget {
  double _medL;
  double _medPilar;
  double _area;
  double _areaPilar;
  TextEditingController _fckController;
  TextEditingController _fykController;

  CalculatePage(this._medL, this._medPilar, this._area, this._areaPilar,
      this._fckController, this._fykController);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  String _textMaxHeitgh = "";
  String _textMinHeitgh = "";
  String _angle = "";
  String _verAngle = "";
  String _tenLimitText = "";
  String _tenPilText = "";
  String _tenEstText = "";

  double pi = 3.1415926535897932;

  TextEditingController _alturaUtilController = TextEditingController();
  TextEditingController _loadController = TextEditingController();

  void _calculatePileHeitgh() {
    setState(() {
      double _angRadMax = 55 * pi / 180;
      double _tanAngMax = tan(_angRadMax);
      double _product = ((widget._medL / 2) - (widget._medPilar / 4));
      double _maxHeight = _tanAngMax * _product / 0.9;

      double _angRadMin = 45 * pi / 180;
      double _tanAngMin = tan(_angRadMin);
      double _minHeight = _tanAngMin * _product / 0.9;

      _textMaxHeitgh =
          "Altura máxima é: ${_maxHeight.toStringAsPrecision(4)} cm";
      _textMinHeitgh =
          "Altura mínima é: ${_minHeight.toStringAsPrecision(4)} cm";
    });
  }

  void _calculateAngle() {
    setState(() {
      double _altUtil = double.parse(_alturaUtilController.text);
      double _product = ((widget._medL / 2) - (widget._medPilar / 4));
      double _angTanRad = 0.9 * _altUtil / _product;
      double _angRad = atan(_angTanRad);
      double _angGrau = _angRad * 180 / pi;

      if (_angGrau >= 45.0 && _angGrau <= 55.0) {
        _angle = "O valor do ângulo é: ${_angGrau.toStringAsPrecision(4)}º";
        _verAngle = "O ângulo é permitido!";
      } else {
        _angle = "O valor do ângulo é: ${_angGrau.toStringAsPrecision(4)}º";
        _verAngle = "O ângulo está fora dos limites!";
      }
    });
  }

  void _calculateTension() {
    setState(() {
      double _altUtil = double.parse(_alturaUtilController.text);
      double _product = ((widget._medL / 2) - (widget._medPilar / 4));
      double _angTanRad = 0.9 * _altUtil / _product;
      double _angRad = atan(_angTanRad);

      double _fck = double.parse(widget._fckController.text);
      double _tenLimit = 0.9 * _fck;
      _tenLimitText = "A tensão limite é: $_tenLimit MPa";

      double _load = double.parse(_loadController.text);
      double _senAng = sin(_angRad);
      double _tenPil =
          (1.4 * _load * 1000) / (widget._areaPilar * 100 * _senAng * _senAng);
      if (_tenPil > _tenLimit) {
        _tenPilText =
            "A tensão junto ao pilar é: ${_tenPil.toStringAsPrecision(4)} MPa (NÃO OK)";
      } else {
        _tenPilText =
            "A tensão junto ao pilar é: ${_tenPil.toStringAsPrecision(4)} MPa (OK)";
      }

      double _tenEst =
          (1.4 * _load * 1000) / (2 * widget._area * 100 * _senAng * _senAng);
      if (_tenEst > _tenLimit) {
        _tenEstText =
            "A tensão junto a estaca é: ${_tenEst.toStringAsPrecision(4)} MPa (NÃO OK)";
      } else {
        _tenEstText =
            "A tensão junto a estaca é: ${_tenEst.toStringAsPrecision(4)} MPa (OK)";
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _calculatePileHeitgh();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cálculos",
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
                padding: EdgeInsets.only(top: 18.0),
                child: Container(
                  child: Text(
                    "DEFINA A ALTURA ÚTIL DO BLOCO",
                    style: TextStyle(
                        color: darkBlue,
                        fontFamily: "RobotoMono",
                        fontSize: 17.0),
                  ),
                ),
              ),
              Divider(),
              _buildMinText(_textMaxHeitgh),
              _buildMinText(_textMinHeitgh),
              _buildNumberTextField(
                  "ESCOLHA A ALTURA ÚTIL (CM)", _alturaUtilController),
              Padding(
                padding: EdgeInsets.only(top: 7.0),
                child: Container(
                  child: RaisedButton(
                    color: lightBlue,
                    onPressed: _calculateAngle,
                    child: Text(
                      "VERIFICAR",
                      style: TextStyle(
                          color: whiteColor,
                          fontFamily: "RobotoMono",
                          fontSize: 12.0),
                    ),
                  ),
                ),
              ),
              _buildMinText(_angle),
              _buildMinText(_verAngle),
              Divider(),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Container(
                  child: Text(
                    "VERIFICAÇÃO DAS BIELAS",
                    style: TextStyle(
                        color: darkBlue,
                        fontFamily: "RobotoMono",
                        fontSize: 17.0),
                  ),
                ),
              ),
              Divider(),
              _buildNumberTextField(
                  "DIGITE A CARGA AXIAL CENTRADA (kN)", _loadController),
              Container(
                child: RaisedButton(
                  color: lightBlue,
                  onPressed: _calculateTension,
                  child: Text(
                    "VERIFICAR",
                    style: TextStyle(
                        color: whiteColor,
                        fontFamily: "RobotoMono",
                        fontSize: 12.0),
                  ),
                ),
              ),
              _buildMinText(_tenLimitText),
              _buildMinText(_tenPilText),
              _buildMinText(_tenEstText),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Container(
                  child: RaisedButton(
                    color: lightBlue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => DimPage(
                                  widget._fykController,
                                  _loadController,
                                  _alturaUtilController,
                                  widget._medL,
                                  widget._medPilar)));
                    },
                    child: Text(
                      "AVANÇAR",
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
        ));
  }

  Widget _buildMinText(String text) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
            color: darkBlue, fontFamily: "RobotoMono", fontSize: 13.0),
      ),
    );
  }

  Widget _buildNumberTextField(String title, TextEditingController value) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        child: TextFormField(
          controller: value,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            labelText: title,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
              color: darkBlue,
              fontFamily: "RobotoMono",
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
