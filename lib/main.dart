import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: tictactoe(),
    ),
  );
}

class tictactoe extends StatefulWidget {
  const tictactoe({Key? key}) : super(key: key);

  @override
  State<tictactoe> createState() => _tictactoeState();
}

class _tictactoeState extends State<tictactoe> {
  var grid = [
    '-', '-', '-',
    '-', '-', '-',
    '-', '-', '-'
  ];
  var currentplayer='X';
  void drawXO(i)
  { if(grid[i]=='-')
    {
      setState(() {
        grid[i]=currentplayer;
        currentplayer=(currentplayer=='X')?'O':'X';

      });

      findwinner(grid[i]);//calling
    }

  }
void reset()
{
  setState(() {
    winner='';
    grid = [
      '-', '-', '-',
      '-', '-', '-',
      '-', '-', '-'
    ];
  });
}
var winner='';
  bool checkmove(i1,i2,i3,sign)
  {
    if(grid[i1]==sign && grid[i2]==sign && grid[i3]==sign)
      {
        return true;
      }
    else
      {
        return false;
      }
  }
void findwinner(currentsign)
{
  if(checkmove(0,1,2,currentsign) || checkmove(3,4,5,currentsign) || checkmove(6,7,8,currentsign)//row
  || checkmove(0,3,6,currentsign)|| checkmove(1,4,7,currentsign)|| checkmove(2,5,8,currentsign)//column
|| checkmove(0,4,8,currentsign) || checkmove(2,4,6,currentsign))//diagonal

    {
      setState(() {
        winner=currentsign;
      });
  }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('TicTacToe'),
      ),
      body: Column(


        children: [
          if(winner!='')
            Text('$winner won the game',
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),

          Container(
            margin: EdgeInsets.all(20.0),
            color: Colors.grey[900],
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: grid.length,
              itemBuilder: (context, index) =>Material(
                color: Colors.amber,
                child: InkWell(
                 splashColor: Colors.black,
                  onTap: (){
                        drawXO(index);
                  },
                  child: Center(
                    child: Text(
                      grid[index],
                      style: TextStyle(
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton.icon(onPressed: reset, icon:Icon(Icons.refresh), label:Text('Play Again'))
        ],
      ),
    );
  }
}
