import 'package:dim_blocos/constants.dart';
import 'package:dim_blocos/screens/example.dart';
import 'package:dim_blocos/screens/final_data_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PileCapInfo extends StatefulWidget {
  TextEditingController _medEstacacontroller;
  TextEditingController _medPilarController;
  double _area;
  double _areaPilar;

  PileCapInfo(this._medEstacacontroller, this._medPilarController, this._area,
      this._areaPilar);

  @override
  _PileCapInfoState createState() => _PileCapInfoState();
}

class _PileCapInfoState extends State<PileCapInfo> {
  String _textMinValueA = "Valor mínimo para medida \"a\":";
  String _textMinValueB = "Valor mínimo para medida \"b\":";
  String _textMinValueL = "Valor mínimo para medida \"l\":";

  TextEditingController _medAcontroller = TextEditingController();
  TextEditingController _medBcontroller = TextEditingController();
  TextEditingController _medLcontroller = TextEditingController();

  void _calculateMinValues() {
    setState(() {
      double _medEstaca = double.parse(widget._medEstacacontroller.text);
      double _minValueA1 = 1.5 * _medEstaca;
      double _minValueA2 = _medEstaca + 15;
      double _minValueB;
      double _minValueL = 3 * _medEstaca;

      if (_minValueA1 >= _minValueA2) {
        _textMinValueA = "Valor mínimo para medida \"a\": $_minValueA1 cm";
        _minValueB = 2 * _minValueA1;
        _textMinValueB = "Valor mínimo para medida \"b\": $_minValueB cm";
        _textMinValueL = "Valor mínimo para medida \"l\": $_minValueL cm";
      } else if (_minValueA2 > _minValueA1) {
        _textMinValueA = "Valor mínimo para medida \"a\": $_minValueA2 cm";
        _minValueB = 2 * _minValueA2;
        _textMinValueB = "Valor mínimo para medida \"b\": $_minValueB cm";
        _textMinValueL = "Valor mínimo para medida \"l\": $_minValueL cm";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bloco de Coroamento",
          style: TextStyle(
              color: whiteColor, fontFamily: "RobotoMono", fontSize: 20.0),
        ),
        backgroundColor: lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Container(
                child: Text(
                  "VALORES MÍNIMOS",
                  style: TextStyle(
                      color: darkBlue,
                      fontFamily: "RobotoMono",
                      fontSize: 17.0),
                ),
              ),
            ),
            Divider(),
            _buildMinText(_textMinValueA),
            _buildMinText(_textMinValueB),
            _buildMinText(_textMinValueL),
            Padding(
                padding: EdgeInsets.only(top: 10.0, left: 50.0),
                child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: _calculateMinValues,
                          color: lightBlue,
                          child: Text(
                            "Calcular Valores Mínimos",
                            style: TextStyle(
                                color: whiteColor,
                                fontFamily: "RobotoMono",
                                fontSize: 12.0),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PileImage()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Icon(
                              Icons.help,
                              color: lightBlue,
                              size: 30.0,
                            ),
                          ),
                        )
                      ],
                    ))),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 3.0),
              child: Container(
                child: Text(
                  "MEDIDAS DO BLOCO",
                  style: TextStyle(
                      color: darkBlue,
                      fontFamily: "RobotoMono",
                      fontSize: 17.0),
                ),
              ),
            ),
            Divider(),
            _buildNumberTextField("MEDIDA A (CM)", _medAcontroller),
            _buildNumberTextField("MEDIDA B (CM)", _medBcontroller),
            _buildNumberTextField("MEDIDA L (CM)", _medLcontroller),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Container(
                child: RaisedButton(
                  color: lightBlue,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => FinalData(
                                _medLcontroller,
                                widget._medPilarController,
                                widget._area,
                                widget._areaPilar)));
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
      ),
    );
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
