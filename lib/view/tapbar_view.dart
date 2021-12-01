import 'package:flutter/material.dart';

class TapBar extends StatelessWidget {
  const TapBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
 
    return  Container(
       width: width ,                   
                        child: const TabBar(  
                                                                 
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(text: 'Acerca' ,                           
                            ),
                             Tab(text: 'Base',),
                              Tab(text: 'Evolución',),
                               Tab(text: 'Movimiento',)
                        ]
                        
                        ),                                           
                      
     
      );
      
  }
}