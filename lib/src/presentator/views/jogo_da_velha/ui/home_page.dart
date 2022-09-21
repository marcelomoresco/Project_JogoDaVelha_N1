import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool primeiraJogadaX = true;
  List<String> mostrarXouO = ['', '', '', '', '', '', '', '', ''];
  int filledBox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: Text(
                          mostrarXouO[index],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (primeiraJogadaX && mostrarXouO[index] == '') {
        mostrarXouO[index] = 'X';
        filledBox + 1;
      } else if (!primeiraJogadaX && mostrarXouO[index] == '') {
        mostrarXouO[index] = 'O';
        filledBox + 1;
      }
      primeiraJogadaX = !primeiraJogadaX;
      _checkWinner();
    });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        mostrarXouO[i] = '';
      }
    });

    filledBox == 0;
  }

  void _checkWinner() {
    //Vendo a primeira Linha
    if (mostrarXouO[0] == mostrarXouO[1] &&
        mostrarXouO[0] == mostrarXouO[2] &&
        mostrarXouO[0] != '') {
      _showWinDialog(mostrarXouO[0]);
    }

    //Vendo a segunda Linha
    if (mostrarXouO[3] == mostrarXouO[4] &&
        mostrarXouO[3] == mostrarXouO[5] &&
        mostrarXouO[3] != '') {
      _showWinDialog(mostrarXouO[3]);
    }

    //Vendo a terceira Linha
    if (mostrarXouO[6] == mostrarXouO[7] &&
        mostrarXouO[6] == mostrarXouO[8] &&
        mostrarXouO[6] != '') {
      _showWinDialog(mostrarXouO[6]);
    }

    //Vendo a primeira COLUNA
    if (mostrarXouO[0] == mostrarXouO[3] &&
        mostrarXouO[0] == mostrarXouO[6] &&
        mostrarXouO[0] != '') {
      _showWinDialog(mostrarXouO[0]);
    }

    //Vendo a segunda COLUNA
    if (mostrarXouO[1] == mostrarXouO[4] &&
        mostrarXouO[1] == mostrarXouO[7] &&
        mostrarXouO[1] != '') {
      _showWinDialog(mostrarXouO[1]);
    }

    //Vendo a terceira COLUNA
    if (mostrarXouO[2] == mostrarXouO[5] &&
        mostrarXouO[2] == mostrarXouO[8] &&
        mostrarXouO[2] != '') {
      _showWinDialog(mostrarXouO[2]);
    }

    //CHECANDO DIAGONAL
    if (mostrarXouO[6] == mostrarXouO[4] &&
        mostrarXouO[6] == mostrarXouO[2] &&
        mostrarXouO[6] != '') {
      _showWinDialog(mostrarXouO[6]);
    }

    //CHECANDO DIAGONAL
    if (mostrarXouO[0] == mostrarXouO[4] &&
        mostrarXouO[0] == mostrarXouO[8] &&
        mostrarXouO[0] != '') {
      _showWinDialog(mostrarXouO[0]);
    } else if (filledBox == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Empate"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Jogar Novamente!"))
            ],
          );
        });
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Venceuuuu!!!"),
            content: Text("O vencedor foi o " + winner),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Jogar Novamente!"))
            ],
          );
        });
  }
}
