import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/view/detalles_view.dart';
import 'package:transparent_image/transparent_image.dart';


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
var width = MediaQuery.of(context).size.width;
var height = MediaQuery.of(context).size.height;
    return  Scaffold(
     
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset('assets/pokeball.png', width: 200, fit: BoxFit.fitWidth),),
             const Positioned(
               top: 80,
               left: 20,
              child:  Text(
                'Pokedex\n Kanto',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
           Positioned(
             top: 150,
             bottom: 0,
             width: width,
             child: Column(
                     children: [
             pokedexkanto != null ? Expanded(child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                ), itemCount: pokedexkanto?.length,
                itemBuilder: (context, i) {
                  var tipo = pokedexkanto![i]['type'][0];
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                      child: Container(
                        decoration:   BoxDecoration(
                          color: 
                           tipo == 'Grass' ? Colors.greenAccent 
                          : tipo == 'Fire' ? Colors.redAccent
                          : tipo == 'Water' ? Colors.blue
                          : tipo == 'Electric' ? Colors.yellow
                          : tipo == 'Rock' ? Colors.grey 
                          : tipo == 'Ground' ? Colors.brown
                          : tipo == 'Psychic' ? Colors.indigo
                          : tipo == 'Fighting' ? Colors.orange
                          : tipo == 'Bug' ? Colors.lightGreenAccent
                          : tipo == 'Ghost' ? Colors.deepPurple
                          : tipo == 'Normal' ? Colors.black26
                          : tipo == 'Posion' ? Colors.purple
                          : Colors.purple,
                          borderRadius: const BorderRadius.all(Radius.circular(20) ),
                        ),
                        child: Stack(            
                          children: [
                            Positioned(
                              bottom: -10,
                              right: -10,
                              child: Image.asset('assets/pokeball.png',
                            height: 100,
                             fit: BoxFit.fitHeight,
                            )),
                            //nombre del pokemon
                              Positioned(
                                top: 20,
                                left: 10,
                                child: Text(
                                  pokedexkanto?[i]['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                              //Tipo que es el pokemon
                              Positioned(
                                top: 45,
                                left: 20,
                                child: Container(
                                  child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4, bottom: 4),
                                  child: Text(
                                   tipo.toString(),
                                   style: const TextStyle(
                                     color: Colors.white
                                   ),
                                  ),
                                  ),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Colors.black26
                                  ),
                                ),
                              ),
                              //hizimos un placeholder una imagen que espera mientras carga todo y luego carga la imagen,
                              //hay que cambiarla por CacheImagen porque tarda en cargar
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: CachedNetworkImage(imageUrl: pokedexkanto![i]['img'],
            height: 100,
            fit: BoxFit.fitHeight,
          )
                              ),
                              
                            ],
                         
                        ),
                      ),
                    ),
                    onTap: (){
                      //Navegar a la pantalla de detalles
                      Navigator.push(context, MaterialPageRoute(builder: (_) => PokemonDetallesView(
                        pokemonDetalles: pokedexkanto![i],
                        color: 
                        tipo == 'Grass' ? Colors.greenAccent 
                          : tipo == 'Fire' ? Colors.redAccent
                          : tipo == 'Water' ? Colors.blue
                          : tipo == 'Electric' ? Colors.yellow
                          : tipo == 'Rock' ? Colors.grey 
                          : tipo == 'Ground' ? Colors.brown
                          : tipo == 'Psychic' ? Colors.indigo
                          : tipo == 'Fighting' ? Colors.orange
                          : tipo == 'Bug' ? Colors.lightGreenAccent
                          : tipo == 'Ghost' ? Colors.deepPurple
                          : tipo == 'Normal' ? Colors.black26
                          : tipo == 'Posion' ? Colors.purple
                          : Colors.purple,
                        heroTag: i,
                      )));
                    },
                  );
                },
                ),
             ): const Center(
               child: CircularProgressIndicator(),
             )   
                     ]
                   ),
           ),

        ],
        
      )
    );
  }

  //Funcion para llamar datos de pokemon
   void fetchPokemonData() async {
    var url = Uri.https("raw.githubusercontent.com", "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    await http.get(url).then((value) {
       if(value.statusCode == 200) {
         var decodedJsonData = jsonDecode(value.body);
      pokedexkanto = decodedJsonData['pokemon'];
      
      setState(() {
        
      });
      
      
       } else {
         
       }

      
    });


  }
  
}
