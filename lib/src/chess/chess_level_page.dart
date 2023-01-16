import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


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

    }
  }
}