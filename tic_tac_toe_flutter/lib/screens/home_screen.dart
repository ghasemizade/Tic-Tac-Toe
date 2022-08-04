import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  get isTurnO => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        title: Text('Tic Tac Toe'),
      ),
      backgroundColor: Colors.blueGrey[900],
      body: Column(
        children: [
          _getPlayerScoreBoard(),
          _getGridView(),
        ],
      ),
    );
  }

  Widget _getPlayerScoreBoard() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player O',
                  style: TextStyle(color: Colors.red, fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.red, fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player X',
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getTurn() {
    return Text(
      isTurnO ? 'Turn O' : 'TurnX',
      style: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _getGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
            ),
          );
        },
      ),
    );
  }
}
