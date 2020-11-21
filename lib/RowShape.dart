import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/Shape.dart';

import 'game.dart';

class RowShape extends StatefulWidget{
  Game game;
  int rowNum;
  void Function(String) changeView;
  RowShape({this.game,this.rowNum,this.changeView});

  @override
  State<StatefulWidget> createState() {
    return new RowShapeState();
  }

}

class RowShapeState extends State<RowShape>{

  @override
  Widget build(BuildContext context) {
    List column = [0,1,2];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: column.map<Widget>((colNum) => Shape(game:widget.game,row:widget.rowNum,column:colNum,changeView: widget.changeView)).toList(),
    );
  }

}