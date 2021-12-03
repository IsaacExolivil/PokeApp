import 'package:flutter/material.dart';
import 'package:poke_app/view/home_view.dart';

class AcercaView extends StatefulWidget {
  final pokemonDetalles;
  final Color? color;
  final int? heroTag;
  const AcercaView({Key? key, this.pokemonDetalles, this.color, this.heroTag}) : super(key: key);

  @override
  _AcercaViewState createState() => _AcercaViewState();
}

class _AcercaViewState extends State<AcercaView> {
    List? pokedexkanto;
  @override
  Widget build(BuildContext context) {

    return  Container(
      child: Column(
        children: [
         const  Text('Hola perro'),
         const  Text('Hola perro'),
          Row(children:  [
             Text('Nombre:',
            style: TextStyle(
              color: Colors.blueGrey, fontSize: 18
            ),
            ),
            
           
           
            
          ],)
        ],
        
      ),
    );
  }
}