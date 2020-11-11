import 'package:dim_blocos/screens/calculate_screen.dart';
import 'package:flutter/material.dart';
import 'package:dim_blocos/constants.dart';

// ignore: must_be_immutable
class FinalData extends StatefulWidget {
  TextEditingController _medLcontroller;
  TextEditingController _medPilarController;
  double _area;
  double _areaPilar;

  FinalData(this._medLcontroller, this._medPilarController, this._area,
      this._areaPilar);

  @override
  _FinalDataState createState() => _FinalDataState();
}

class _FinalDataState extends State<FinalData> {
  TextEditingController _fckController = TextEditingController();
  TextEditingController _eWeitghConcreteController = TextEditingController();
  TextEditingController _fykController = TextEditingController();

  void _calculate() {
    setState(() {
      double _medL = double.parse(widget._medLcontroller.text);
      double _medPilar = double.parse(widget._medPilarController.text);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => CalculatePage(
                  _medL,
                  _medPilar,
                  widget._area,
                  widget._areaPilar,
                  _fckController,
                  _fykController)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informações Finais",
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
                  "DADOS DO CONCRETO",
                  style: TextStyle(
                      color: darkBlue,
                      fontFamily: "RobotoMono",
                      fontSize: 17.0),
                ),
              ),
            ),
            Divider(),
            _buildNumberTextField("FCK (MPa)", _fckController),
            _buildNumberTextField(
                "PESO ESPECÍFICO (kN/m³)", _eWeitghConcreteController),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 3.0),
              child: Container(
                child: Text(
                  "DADOS DO AÇO",
                  style: TextStyle(
                      color: darkBlue,
                      fontFamily: "RobotoMono",
                      fontSize: 17.0),
                ),
              ),
            ),
            Divider(),
            _buildNumberTextField("FYK (kN/cm²)", _fykController),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0),
              child: Container(
                child: Text(
                  "PARA RESULTADOS MAIS PRECISOS, TOME COMO BASE VALORES NORMATIZADOS PARA OS ITENS ACIMA.",
                  style: TextStyle(
                      color: darkBlue,
                      fontFamily: "RobotoMono",
                      fontSize: 12.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Container(
                child: RaisedButton(
                  color: lightBlue,
                  onPressed: _calculate,
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
