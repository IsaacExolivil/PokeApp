import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  const [
                      TapBar(),                     
                    ],
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                                  Text('holaaa'),
                                  Text('Soy Isaac'),
                                  Text('LOPEZ'),
                                  Text('LOPEZZZZ')
                                ],
                      ),
                    )
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

