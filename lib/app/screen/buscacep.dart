import 'package:buscarcep/app/services/models/address.dart';
import 'package:buscarcep/app/services/repository/address_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BuscarCep extends StatefulWidget {
  @override
  _BuscarCepState createState() => _BuscarCepState();
}

class _BuscarCepState extends State<BuscarCep> {
  final _addressRepository = AddressRepository(Dio());
  AddressModel response;
  var cepController = TextEditingController();
  bool isLoading = false;
  bool isNotFoundCep = false;

  void getCep() {
    setState(() {
      isLoading = true;
    });
    _addressRepository.findById(cepController.text).then(
      (value) {
        setState(
          () {
            response = value;
            isLoading = false;
            isNotFoundCep = false;
          },
        );
      },
    ).catchError(
      (e) => setState(
        () {
          isLoading = false;
          isNotFoundCep = true;
        },
      ),
    );
  }

  Widget responseWidget() {
    if (isLoading && response == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isNotFoundCep) {
      return Text(
        "CEP não encontrado!",
        style: TextStyle(
          fontSize: 20,
        ),
      );
    }
    if (response == null) {
      return SizedBox(
        height: 20,
      );
    }

    return Column(
      children: <Widget>[
        Text(
          "Bairro: ${response.district}",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          "Endereço: ${response.address}",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          "Cidade: ${response.city} - ${response.state}",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  TextFormField(
                    maxLength: 8,
                    maxLengthEnforced: true,
                    cursorColor: Colors.green,
                    controller: cepController,
                    // onChanged: (_) => getCep(),
                    onFieldSubmitted: (_) => getCep(),
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
                  responseWidget(),
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
                    onPressed: getCep,
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
