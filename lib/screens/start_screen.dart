import 'package:dim_blocos/constants.dart';
import 'package:dim_blocos/screens/pile_cap_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  TextEditingController _medEstacacontroller = TextEditingController();
  TextEditingController _medPilarController = TextEditingController();
  List<String> _pileSection = ["QUADRADA", "CIRCULAR"];

  double pi = 3.1415926535897932;

  String _selectedSection = "QUADRADA";
  void _calculateArea() {
    setState(() {
      double _medEstaca = double.parse(_medEstacacontroller.text);
      // ignore: unused_local_variable
      double _area;
      if (_selectedSection == "QUADRADA") {
        _area = _medEstaca * _medEstaca;
      } else if (_selectedSection == "CIRCULAR") {
        _area = (pi * _medEstaca * _medEstaca) / 4;
      }
      double _medPilar = double.parse(_medPilarController.text);
      // ignore: unused_local_variable
      double _areaPilar;
      _areaPilar = _medPilar * _medPilar;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PileCapInfo(
                  _medEstacacontroller,
                  _medPilarController,
                  _area,
                  _areaPilar)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightBlue,
          centerTitle: true,
          title: Text(
            "Dados Iniciais",
            style: TextStyle(
                color: whiteColor, fontFamily: "RobotoMono", fontSize: 20.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  child: Container(
                    child: Center(
                      child: Text(
                        "INFORMAÇÕES DA ESTACA",
                        style: TextStyle(
                            color: darkBlue,
                            fontFamily: "RobotoMono",
                            fontSize: 17.0),
                      ),
                    ),
                  )),
              Divider(),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      alignment: Alignment.topLeft,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            labelText: "ESCOLHA O FORMATO DA SEÇÃO",
                            labelStyle: TextStyle(
                                fontFamily: "RobotoMono", fontSize: 13.0)),
                        style: TextStyle(
                            color: darkBlue,
                            fontFamily: "RobotoMono",
                            fontSize: 14.0),
                        value: _selectedSection,
                        onChanged: (value) {
                          setState(() {
                            _selectedSection = value;
                          });
                        },
                        items:
                            _pileSection.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                      ))),
              buildNumberTextField(
                  "DIÂMETRO OU LADO (CM)", _medEstacacontroller),
              Divider(),
              Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Container(
                    child: Center(
                      child: Text(
                        "INFORMAÇÕES DO PILAR",
                        style: TextStyle(
                            color: darkBlue,
                            fontFamily: "RobotoMono",
                            fontSize: 17.0),
                      ),
                    ),
                  )),
              Divider(),
              buildNumberTextField("LADO DO PILAR (CM)", _medPilarController),
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Container(
                  child: RaisedButton(
                    color: lightBlue,
                    onPressed: _calculateArea,
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

  Widget buildNumberTextField(String title, TextEditingController value) {
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
