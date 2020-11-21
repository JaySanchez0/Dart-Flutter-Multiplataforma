import 'package:flutter/material.dart';

import 'game.dart';

// ignore: must_be_immutable
class Shape  extends StatefulWidget{
  Game game;
  int row;
  int column;

  Shape({this.game,this.row,this.column});

  @override
  State<StatefulWidget> createState() {
    return ShapeState();
  }

}

class ShapeState extends State<Shape>{

  String value = "O";

  void changeValue(){
    int row = widget.row;
    int column = widget.column;
    String cad = "X";
    setState(() {
      this.value= cad;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: SizedBox(
        width: 30,
        height: 60,
        child: Text(value),
      ),
      onPressed: changeValue,
    );
  }

}