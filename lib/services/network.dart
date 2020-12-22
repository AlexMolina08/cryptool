// API KEY 3c5bbdd979e0d1fb076d1e66f3e22fa6

//https://api.nomics.com/v1/currencies/ticker?key=3c5bbdd979e0d1fb076d1e66f3e22fa6&ids=BTC,nterval=1d,30d&convert=USD&per-page=100&page=1%22

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

/*
* Clase Network llama y recibe datos de la API
* */
class Network{

  final String apiUrl;

  Network({@required this.apiUrl});


  // Devuelve un hasMap<String,Dynamic> con los datos obtenidos de coinApi
  Future getData() async{
    http.Response response = await http.get(apiUrl); //obtenemos los datos

    if(response.statusCode == 200){ //OK.
      print("datos obtenidos correctamente");
      String data = response.body;
      return jsonDecode(data);
    }else{
      print("ERROR: Problema al obtener datos de la API url");
    }
  }

}