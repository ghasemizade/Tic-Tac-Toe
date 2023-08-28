import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTurnO = true;

  List<String> XorOList = ['', '', '', '', '', '', '', '', ''];
  int fildBox = 0;
  bool hasResult = false;
  int scoreX = 0;
  int scoreO = 0;
  String winnerTitle = 'loading...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[800],
        centerTitle: true,
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            onPressed: () {
              refreshGame();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey[800],
      body: SafeArea(
        child: Column(
          children: [
            _getPlayerScoreBoard(),
            SizedBox(
              height: 5.0,
            ),
            _getResultButton(),
            SizedBox(
              height: 5.0,
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

  Widget _getResultButton() {
    return Visibility(
      visible: hasResult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          side: BorderSide(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            hasResult = false;
            refreshGame();
          });
        },
        child: Text(
          '$winnerTitle, play again!',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _getTurn() {
    return Text(
      isTurnO ? "Turn O" : "Turn X",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24.0,
        fontWeight: FontWeight.w800,
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
                child: Container(
                  height: 100.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('Images/man_avatar.png'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Player O',
                        style: TextStyle(color: Colors.blue, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$scoreO',
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
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
                child: Container(
                  height: 100.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('Images/woman_avatar.png'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Player X',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$scoreX',
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
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
              child: Center(
                child: Text(
                  XorOList[index],
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                    color: XorOList[index] == 'X' ? Colors.green : Colors.blue,
                  ),
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
    if (hasResult) {
      return;
    }

    setState(() {
      if (XorOList[index] != '') {
        return;
      }

      if (isTurnO) {
        XorOList[index] = 'O';
        fildBox++;
      } else {
        XorOList[index] = 'X';
        fildBox++;
      }
      isTurnO = !isTurnO;

      checkWinner();
    });
  }

  void checkWinner() {
    // Row-------------------------------------------
    if (XorOList[0] == XorOList[1] &&
        XorOList[0] == XorOList[2] &&
        XorOList[0] != '') {
      setResult(XorOList[0], 'Winner is ' + XorOList[0]);
      return;
    }

    if (XorOList[3] == XorOList[4] &&
        XorOList[3] == XorOList[5] &&
        XorOList[3] != '') {
      setResult(XorOList[3], 'Winner is ' + XorOList[3]);
      return;
    }

    if (XorOList[6] == XorOList[7] &&
        XorOList[6] == XorOList[8] &&
        XorOList[6] != '') {
      setResult(XorOList[6], 'Winner is ' + XorOList[6]);
      return;
    }

    // Column----------------------------------------
    if (XorOList[0] == XorOList[3] &&
        XorOList[0] == XorOList[6] &&
        XorOList[0] != '') {
      setResult(XorOList[0], 'Winner is ' + XorOList[0]);
      return;
    }

    if (XorOList[1] == XorOList[4] &&
        XorOList[1] == XorOList[7] &&
        XorOList[1] != '') {
      setResult(XorOList[1], 'Winner is ' + XorOList[1]);
      return;
    }

    if (XorOList[2] == XorOList[5] &&
        XorOList[2] == XorOList[8] &&
        XorOList[2] != '') {
      setResult(XorOList[2], 'Winner is ' + XorOList[2]);
      return;
    }

    //Diagonal---------------------------------------
    if (XorOList[0] == XorOList[4] &&
        XorOList[0] == XorOList[8] &&
        XorOList[0] != '') {
      setResult(XorOList[0], 'Winner is ' + XorOList[0]);
      return;
    }

    if (XorOList[2] == XorOList[4] &&
        XorOList[2] == XorOList[6] &&
        XorOList[2] != '') {
      setResult(XorOList[2], 'Winner is ' + XorOList[2]);
      return;
    }

    //Draw-------------------------------------------
    if (fildBox == 9) {
      setResult('', 'Draw');
    }
  }

  void setResult(String winner, String title) {
    setState(() {
      hasResult = true;
      winnerTitle = title;
      if (winner == 'X') {
        scoreX++;
      } else if (winner == 'O') {
        scoreO++;
      }
    });
  }

  void refreshGame() {
    setState(() {
      for (var i = 0; i < XorOList.length; i++) {
        XorOList[i] = '';
      }
    });

    fildBox = 0;
  }
}
