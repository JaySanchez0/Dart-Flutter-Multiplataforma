import 'package:flutter/material.dart';
import 'package:flutter_app2/RowShape.dart';
import 'package:flutter_app2/game.dart';

import 'WinnerScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tricky'),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget{
  String title;
  MyHomePage({this.title});
  @override
  State<StatefulWidget> createState() {
    return new MyHomePageState();
  }

}

class MyHomePageState extends State<MyHomePage> {
  final Game game= new Game();

  void changeView(String winner) async{
    print("------------------- Entro winner");
    var back = await Navigator.push(context, MaterialPageRoute(builder: (context)=>new WinnerScreen(winner: winner)));
    setState(() {
      game.restart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Column( 
              children:[0,1,2].map<Widget>((i){
                  return RowShape(game:game,rowNum: i,changeView:this.changeView);
                }).toList()
            ),Column(
              children: [OutlineButton(
                child: Text("Restart"),
                onPressed: (){
                  setState(() {
                    game.restart();
                  });
                }
              )]
            )
          ]
        ),
      ),
    );
  }
}
