import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String _binario = "";
  String _decimal = "";
  String cabeza = "Bin => Dec";
  bool st = true;

  void escribir(String n) {
    setState(() {
      if (n == "Reset") {
        _clear();
      } else {
        _binario = _binario + n;
        if (st == true) {
          _conver_bintodec(_binario);
        } else {
          _conver_dectobin(_binario);
        }
      }
    });
  }

  void sw() {
    setState(() {
      if (st == false) {
        cabeza = "Bin => Dec";
        st = true;
      } else {
        cabeza = "Dec => Bin";
        st = false;
      }
      _clear();
    });
  }

  void _clear() {
    setState(() {
      _binario = "";
      _decimal = "";
    });
  }

  void _conver_bintodec(String bin) {
    int dv = 0;
    int bv = int.parse(bin);
    int ld;
    int i = 1;
    while (bv > 0) {
      ld = bv % 10;
      bv = (bv / 10).floor();
      dv += ld * i;
      i = i * 2;
    }
    _decimal = dv.toString();
  }

  void _conver_dectobin(String dec) {
    int dv = int.parse(dec);
    int bc = 0;
    int i = 1;
    while (dv > 0) {
      bc = bc + (dv % 2) * i;
      dv = (dv / 2).floor();
      i = i * 10;
    }
    _decimal = bc.toString();
  }

  Widget dectobin() {
    return (Expanded(
      flex: 4,
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: <Widget>[
                    treebtn("1", "2", "3"),
                    treebtn("4", "5", "6"),
                    treebtn("7", "8", "9"),
                    onebtn("0"),
                    onebtn("Reset")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget onebtn(String a) {
    return (Expanded(
      child: Container(
          margin: const EdgeInsets.all(1.0),
          padding: const EdgeInsets.all(1.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                escribir("$a");
              },
              textColor: Colors.black,
              child: Text(
                "$a",
                style: new TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              color: Colors.green,
            ),
          )),
    ));
  }

  Widget treebtn(
    String a,
    String b,
    String c,
  ) {
    return (Expanded(
      child: Container(
        child: Row(
          children: <Widget>[
            onebtn(a),
            onebtn(b),
            onebtn(c),
          ],
        ),
      ),
    ));
  }

  Widget bintodec() {
    return (Expanded(
      flex: 4,
      child: Container(
          child: new Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.green)),
                              padding: const EdgeInsets.all(8.0),
                              onPressed: () {
                                escribir("0");
                              },
                              textColor: Colors.black,
                              child: Text(
                                "0",
                                style: new TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.blue,
                            ),
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.green)),
                              padding: const EdgeInsets.all(8.0),
                              onPressed: () {
                                escribir("1");
                              },
                              textColor: Colors.black,
                              child: Text(
                                "1",
                                style: new TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.blue,
                            ),
                          )),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(
                margin: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green)),
                    padding: const EdgeInsets.all(8.0),
                    onPressed: _clear,
                    textColor: Colors.white,
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blue,
                  ),
                )),
          )
        ],
      )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Conversor"),
      ),
      body: new Center(
          child: Container(
              margin: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                    onTap: () {
                                      sw();
                                    },
                                    child: new Text(
                                      "$cabeza",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '$_binario',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '$_decimal',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  if (st == true) bintodec() else dectobin()
                ],
              ))),
    );
  }
}
