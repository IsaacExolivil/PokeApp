import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:poke_app/view/acerca_view.dart';
import 'package:poke_app/view/tapbar_view.dart';

class PokemonDetallesView extends StatefulWidget {

  final pokemonDetalles;
  final Color? color;
  final int? heroTag;

  const PokemonDetallesView({Key? key, this.pokemonDetalles, this.color, this.heroTag}) : super(key: key);

 

  @override
  _PokemonDetallesViewState createState() => _PokemonDetallesViewState();

}

class _PokemonDetallesViewState extends State<PokemonDetallesView> with TickerProviderStateMixin{
 
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
 var huevo = widget.pokemonDetalles['egg'];
    var width = MediaQuery.of(context).size.width;
var height = MediaQuery.of(context).size.height; 
    return DefaultTabController(
      
      length: 4,
      child: Scaffold(
        backgroundColor: widget.color,
        body: Stack(
          alignment: Alignment.center,
          children: [
             Positioned(
              top: 40,
              left: 10,
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30,))),
              Positioned(
              top: 40,
              right: 10,
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.favorite_border_outlined, color: Colors.white, size: 30,))),
              Positioned(
              top: 110,
              right: 50,
              child: Text('#'+
                widget.pokemonDetalles['num'],
                style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              )),      
               Positioned(
              top: 80,
              left: 20,
              child: Text(widget.pokemonDetalles['name'],
              style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold,
                fontSize: 30
              ),)),
              Positioned(
                top: 140,
                left: 20,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8.0, top: 4.0, bottom: 4.0),
                    child: Text(
                    widget.pokemonDetalles['type' ].join(",  "),
                    style: const TextStyle(
                      color: Colors.white
                    ),
              ),
                  ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10),),
                color: Colors.black26
              ),
                ),
              
              ),
                   Positioned(
              top: height * 0.17,
              right: -10,
              child: Image.asset('assets/pokeball.png', width: 200, fit: BoxFit.fitHeight,)),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.6,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  color: Colors.white
                ), 
                child: Column(
               
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  const [
                      TapBar(),                     
                    ],
                    ),
                     Expanded(
                             child: TabBarView(
                          
                          children: [
                           
                                   Column(                                   
                                     children: [                                     
                                       Column(
                                         children: [
                                           SizedBox(height: 50,),
                                             Row(
                                           children:  [
                                             const Text(' Nombre:',
                                             style: TextStyle(
                                               color: Colors.blueGrey, fontSize: 18
                                             ),),
                                            
                                             SizedBox(width: width * 0.15,),
                                             Text(widget.pokemonDetalles['name'],                                     
                                           style: const TextStyle(
                                             color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                                           ),)
                                           ],
                                         ),
                                         Column(
                                           children: [
                                             SizedBox(height: height * 0.03,),
                                              Row(                                            
                                               children:  [
                                                 const Text('  Peso:',
                                             style: TextStyle(
                                               color: Colors.blueGrey, fontSize: 18
                                             ),),
                                             SizedBox(width: width * 0.15),
                                             Text(widget.pokemonDetalles['weight'],                                     
                                           style: const TextStyle(
                                             color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                                           ),)
                                             
                                               ],
                                             ),
                                              Column(
                                           children: [
                                             SizedBox(height: height * 0.03,),
                                              Row(                                            
                                               children:  [
                                                 const Text('  Altura:',
                                             style: TextStyle(
                                               color: Colors.blueGrey, fontSize: 18
                                             ),),
                                             SizedBox(width: width * 0.15),
                                             Text(widget.pokemonDetalles['height'],                                     
                                           style: const TextStyle(
                                             color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                                           ),)
                                             
                                               ],
                                             ),
                                             Column(
                                               
                                           children: [
                                             SizedBox(height: height * 0.03,),
                                              Row(     
                                                                                      
                                               children:  [
                                                 
                                                 const Text('Egg Pokemon Go:',
                                             style: TextStyle(
                                               color: Colors.blueGrey, fontSize: 18
                                             ),),
                                             SizedBox(width: width * 0.04),
                           huevo == '2 km' ?  Image.asset('assets/huevo2km.png',   height: 50, width: 50,
                                             ) : huevo == '5 km' ? Image.asset('assets/huevo5km.png',   height: 50, width: 50,
                                             ) : 
                                              
                                            SizedBox(width: width *0.01,),
                                             Text(widget.pokemonDetalles['egg'],                                     
                                           style: const TextStyle(
                                             color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                                           ),)
                                             
                                               ],
                                             ),
                                             Column(
                                           children: [
                                             SizedBox(height: height * 0.03,),
                                              Row(                                            
                                               children:  [
                                                 const Text('Caramelos para evolucionar :',
                                             style: TextStyle(
                                               color: Colors.blueGrey, fontSize: 18
                                             ),),
                                             SizedBox(width: width * 0.03),
                                             
                                             Image.asset('assets/candy.png',
                                           height: 50,
                                           width: 50,
                                           ),
                                            SizedBox(width: width *0.01,),
                                             Text(widget.pokemonDetalles['candy_count'].toString(),
                                                                               
                                           style: const TextStyle(
                                             color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                                           ),),                                          
                                               ],
                                             ),
                                              Column(
                                           children: [
                                             SizedBox(height: height * 0.03,),
                                              Row(                                            
                                               children:  [
                                                 const Text('Avg spawns :',
                                             style: TextStyle(
                                               color: Colors.blueGrey, fontSize: 18
                                             ),),
                                             SizedBox(width: width * 0.03),                                          
                                            SizedBox(width: width *0.01,),
                                             Text(widget.pokemonDetalles['avg_spawns'].toString(),
                                                                               
                                           style: const TextStyle(
                                             color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                                           ),),                                          
                                               ],
                                             ),
                                             Column(
                                           children: [
                                             SizedBox(height: height * 0.03,),
                                              Row(                                            
                                               children:  [
                                                 const Text('Spaw Chance :',
                                             style: TextStyle(
                                               color: Colors.blueGrey, fontSize: 18
                                             ),),
                                             SizedBox(width: width * 0.03),                                          
                                            SizedBox(width: width *0.01,),
                                             Text(widget.pokemonDetalles['spawn_chance'].toString(),
                                                                               
                                           style: const TextStyle(
                                             color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                                           ),),                                          
                                               ],
                                             ),
                                             
                                           ],
                                         ),
                                         
                                             
                                           ],
                                         )
                                             
                                           ],
                                         )
                                             
                                           ],
                                         )
                                           ],
                                         )
                                           ],
                                         )
                      
                                         ],
                                       
                                       ),
                                       
                                     ],
                                    
                                   ),
                                    Text('Soy Isaac'),
                                    Text('LOPEZ'),
                                    Text('LOPEZZZZ')
                                  ],
                        ),
                      ),
                    
                  
                  ],
                ),      
              ),
            ),
            Positioned(
              top: height * 0.23,
              left: (width / 2) - 100,
              child: CachedNetworkImage(imageUrl: widget.pokemonDetalles['img'],
              height: 200,
              fit: BoxFit.fitHeight,
            )
            )  
          ],
        ),
      ),
    );
  }
}

