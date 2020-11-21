import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

// ignore: must_be_immutable
class WinnerScreen extends StatelessWidget{
  String winner;
  WinnerScreen({this.winner});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
         title: Text("Winner"),
         backgroundColor: Colors.teal
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("The Winner Was"+winner),
           OutlineButton(
             child: Text(
               "Back"
             ),
             onPressed: (){
               Navigator.pop(context);
             },
           )
         ],
       ),
     ),
   );
  }

}