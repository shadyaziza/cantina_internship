
import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  @override
  TicTacToeState createState() {
    return new TicTacToeState();
  }
}

class TicTacToeState extends State<TicTacToe> {
  String _choice = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tic Tac Toe')),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          children: List.generate(
            9,
            (int index) => Builder(
                  builder: (con) => GridCell(
                    choice: _choice,
                    onTap: ()=>onTap(con),
                  ),
                ),
          ),
        ));
  }

  void onTap(BuildContext context) => showBottomSheet(
        context: context,
        builder: (_) => Container(
              height: 100.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      child: Text(
                        'X',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      onPressed: () => setState((){
                        this._choice='X';
                      }),
                    ),
                    FloatingActionButton(
                      child: Text(
                        'O',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      onPressed: () => setState((){
                        this._choice='O';
                      }),
                    ),
                  ]),
              color: Colors.blueGrey,
            ),
      );
}
class GridCell extends StatelessWidget {
  final String choice;
  final VoidCallback onTap;

  GridCell({Key key, this.choice, this.onTap}) : 
  super(key: key);

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap:onTap,
     child:Container(
       child: Text(choice),
       height:20.0,
       color:Theme.of(context).primaryColor,
     ),
   );
  }
}
