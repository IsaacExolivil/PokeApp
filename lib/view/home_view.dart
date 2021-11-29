import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/model/poke_api.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   var pokeApi = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List? pokedexkanto;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){ 
      fetchPokemonData();
    }
  }
  @override
  Widget build(BuildContext context) {
 
    return  Scaffold(
     
      body: Column(
        children: [
          pokedexkanto != null ? Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4
          ), itemCount: pokedexkanto?.length,
          itemBuilder: (context, index){
            return Card(
              child: Text(
              pokedexkanto?[index]['name']
              ),
              
              );
            
          },
          )
          ): Center(child: CircularProgressIndicator(),
          )
        ]
      )
    );
  }
  
}
