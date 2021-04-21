import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//coba
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
var listItem1 = [
  "pilih satuan",
  "buah",
  "lusin",
  "gross",
  ];

  var listItem2 = [
  "pilih satuan",
  "buah",
  "lusin",
  "gross",
  ];
  double _kodi=0;
  double _result=0;
  double _buah=0;
  TextEditingController myController = TextEditingController();
  String _newValue1 = "pilih satuan";
    String _newValue2 = "pilih satuan";

  void _suhuCounter(){
    final _inputUser = double.parse(myController.value.text);
    setState((){
      if (_newValue1=="buah" && _newValue2=="lusin"){
        _result = (_inputUser / 12);
      }else if (_newValue1=="lusin" && _newValue2=="buah"){
        _result = (_inputUser * 12);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              TextFormField(
                controller: myController,
                decoration: new InputDecoration(labelText: "Masukkan Suhu Dalam Celcius"),
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    items: listItem1.map((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _newValue1,
                    onChanged: (String changeValue) {
                      setState(() {
                        _newValue1 = changeValue;
                        _suhuCounter();
                      });
                    },
                  ),
                  Text("ke"),
                  DropdownButton<String>(
                    items: listItem2.map((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _newValue2,
                    onChanged: (String changeValue) {
                      setState(() {
                        _newValue2 = changeValue;
                        _suhuCounter();
                      });
                    },
                  ),
                ],
              ),
              //Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        
                        Text("Hasil: "+'$_result'
                          
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  //),
                //],
              ),
              RaisedButton(
                padding: const EdgeInsets.all(10.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){
                  _suhuCounter();
                },
                child: Container(
                  width: 400,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    "Konversi Suhu"
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

