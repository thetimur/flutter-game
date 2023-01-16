import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:game_template/src/chess/engine.dart';

class ChessHomePage extends StatelessWidget {
  const ChessHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChessBoardController controller = ChessBoardController();
  Engine bot = Engine();
  bool start = true;
  String fen = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ChessBoard(
                controller: controller,
                boardColor: BoardColor.orange,
                arrows: [
                  BoardArrow(
                    from: 'd2',
                    to: 'd4',
                    //color: Colors.red.withOpacity(0.5),
                  ),
                  BoardArrow(
                    from: 'e7',
                    to: 'e5',
                    color: Colors.red.withOpacity(0.7),
                  ),
                ],
                boardOrientation: PlayerColor.white,
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Chess>(
              valueListenable: controller,
              builder: (context, game, _) {
                print(game.fen);

                if (!start && fen != game.fen) {
                  bot = Engine.fromFEN(game.fen);
                  List<String> move = bot.play().split(" ");
                  print(move);
                  controller.makeMove(from: move[0], to: move[1]);
                  fen = game.fen;
                } else {
                  start = false;
                }

                return Text(
                  controller.getSan().fold(
                    '',
                        (previousValue, element) =>
                    previousValue + '\n' + (element ?? ''),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}