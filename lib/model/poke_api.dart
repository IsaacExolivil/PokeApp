import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

    var pokeApi = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List? pokedexkanto;
 
 //Funcion para llamar datos de pokemon
  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com", "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
       if(value.statusCode == 200) {
         var decodedJsonData = jsonDecode(value.body);
      pokedexkanto = decodedJsonData['pokemon'];
      print(pokedexkanto?[1]['name']);
      
      
       }
      
    });


  }
