import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class BuscarCep extends StatefulWidget {
  @override
  _BuscarCepState createState() => _BuscarCepState();
}

class _BuscarCepState extends State<BuscarCep> {
  var request = 'https://cep.awesomeapi.com.br/json/';
  var response;
  var cep = TextEditingController();
  Map map = Map();
  var result;

  @override
  void initState() {
    super.initState();
    getCep();
  }

  getCep() async {
    response = await http.get(request + cep.text ?? '');
    setState(() {
      map = jsonDecode(response.body ?? '');
    });

    print(map);
  }

  Widget wid() {
    if ((map.containsKey('info')) || (map == null)) {
      return SizedBox(
        height: 20,
      );
    }
    if (map.containsKey('status')) {
      return Text(
        "CEP não encontrado!",
        style: TextStyle(
          fontSize: 20,
        ),
      );
    } else {
      return Column(
        children: <Widget>[
          Text(
            "Bairro: ${map['district']}",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Endereço: ${map['address']}",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Cidade: ${map['city']} - ${map['state']}",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.all(10),
          bottom: false,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      borderOnForeground: false,
                      child: Image(
                        image: AssetImage("images/loc.gif"),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  // customTF(cep, 'CEP'),
                  TextFormField(
                    maxLength: 8,
                    maxLengthEnforced: true,
                    cursorColor: Colors.green,
                    controller: cep,
                    onChanged: (str) => getCep(),
                    onFieldSubmitted: (str) => getCep(),
                    // onEditingComplete: () => getCep(),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: false,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CEP',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  wid(),
                  Divider(
                    color: Colors.transparent,
                    height: 50,
                  ),
                  FlatButton(
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    padding: EdgeInsets.all(15),
                    color: Colors.lightGreen,
                    onPressed: () async => await getCep(),
                    child: Text(
                      'Buscar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
