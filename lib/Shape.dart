import 'package:flutter/material.dart';
import 'package:flutter_app2/WinnerScreen.dart';

import 'game.dart';

// ignore: must_be_immutable
class Shape  extends StatefulWidget{
  Game game;
  int row;
  int column;
  void Function(String) changeView;
  Shape({this.game,this.row,this.column,this.changeView});

  @override
  State<StatefulWidget> createState() {
    return ShapeState();
  }

}

class ShapeState extends State<Shape>{

  String value = "";

  void changeValue(){
    int row = widget.row;
    int column = widget.column;
    try {
      widget.game.select(row, column);
    }catch(e){

    }
    setState(() {
      this.value= widget.game.getElement(row, column);
    });
    print(widget.game.board.toString());
    if(widget.game.isWin()){
      widget.game.changePlayer();
      widget.changeView(widget.game.player);

    }
  }

  @override
  Widget build(BuildContext context) {
    int row = widget.row;
    int column = widget.column;
    return OutlineButton(
      child: SizedBox(
        width: 30,
        height: 60,
        child: Center(
            child:Text(
                widget.game.getElement(row, column)
            )
        ),
      ),
      onPressed: changeValue,
    );
  }

}