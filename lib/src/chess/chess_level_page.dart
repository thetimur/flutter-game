import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:game_template/src/chess/engine.dart';
import 'package:go_router/go_router.dart';

class ChessLevelPage extends StatelessWidget {
  final String level_path;

  const ChessLevelPage({Key? key, required this.level_path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(level_path: this.level_path),
    );
  }
}

class HomePage extends StatefulWidget {
  final String level_path;

  const HomePage({Key? key, required this.level_path}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(level_path);
}

class _HomePageState extends State<HomePage> {
  final String level_path;

  ChessBoardController controller = ChessBoardController();

  _HomePageState(this.level_path);

  Engine bot = Engine();
  bool start = true;
  bool undo = false;
  String fen = "";

  Future<String> loadAsset(String path) async {
    print('assets/' + path);
    String res = await rootBundle.loadString('assets/' + path);
    print(res);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: loadAsset(level_path),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            controller.loadFen(snapshot.requireData);
            return Scaffold(
              appBar: AppBar(
                title: const Text('Chess Demo'),
              ),
              body: Column(
                children: [
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      // ElevatedButton(
                      //   onPressed: () {
                      //     if (!start) {
                      //       undo = true;
                      //       controller.undoMove();
                      //       controller.undoMove();
                      //       fen = "";
                      //       start = true;
                      //     }
                      //   },
                      //   child: const Text('Undo'),
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          fen = "";
                          start = true;
                          undo = false;
                          controller.loadFen(snapshot.requireData);
                        },
                        child: const Text('Restart'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).go('/play');
                        },
                        child: const Text('Back'),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: ChessBoard(
                        controller: controller,
                        boardColor: BoardColor.green,
                        arrows: [],
                        boardOrientation: PlayerColor.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder<Chess>(
                      valueListenable: controller,
                      builder: (context, game, _) {

                        if (start) {
                          fen = game.fen;
                        }

                        if (!start && fen != game.fen && !controller.isCheckMate() &&
                        !undo) {
                          bot = Engine.fromFEN(game.fen);
                          List<String> move = bot.play().split(" ");
                          //print(move);
                          controller.makeMove(from: move[0], to: move[1]);
                          fen = game.fen;
                        } else if (!undo) {
                          start = false;
                        } else {
                          undo = false;
                        }

                        checkWinCondition(context, game);
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
          } else {
            return CircularProgressIndicator();
          }
        }
    );
  }

  void checkWinCondition(BuildContext context, Chess game) {
    if (game.in_checkmate) {
      print("MATE, blyad");
    }
  }
}