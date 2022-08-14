import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTurnO = true;

  List<String> XorOList = ['', '', '', '', '', '', '', '', ''];

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
      body: SafeArea(
        child: Column(
          children: [
            _getPlayerScoreBoard(),
            SizedBox(
              height: 20.0,
            ),
            _getGridView(),
            _getTurn(),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _getTurn() {
    return Text(
      isTurnO ? "Turn O" : "Turn X",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
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
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
              ),
              child: Text(
                XorOList[index],
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.teal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void tapped(int index) {
    print('$index');
    setState(() {
      if (isTurnO && XorOList[index] == '') {
        XorOList[index] = 'O';
        isTurnO = false;
      }
      if (!isTurnO && XorOList[index] == '') {
        XorOList[index] = 'X';
        isTurnO = true;
      }
    });
  }
}
