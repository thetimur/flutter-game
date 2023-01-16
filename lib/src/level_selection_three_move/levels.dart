// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const gameLevelsThreeMove = [
  GameLevelThreeMove(number: 21, difficulty: 15, level_path: 'levels/three_move/task_1.txt'),
  GameLevelThreeMove(number: 22, difficulty: 15, level_path: 'levels/three_move/task_2.txt'),
  GameLevelThreeMove(number: 23, difficulty: 15, level_path: 'levels/three_move/task_3.txt'),
  GameLevelThreeMove(number: 24, difficulty: 15, level_path: 'levels/three_move/task_4.txt'),
  GameLevelThreeMove(number: 25, difficulty: 15, level_path: 'levels/three_move/task_5.txt'),
  GameLevelThreeMove(number: 26, difficulty: 15, level_path: 'levels/three_move/task_6.txt'),
  GameLevelThreeMove(number: 27, difficulty: 15, level_path: 'levels/three_move/task_7.txt'),
  GameLevelThreeMove(number: 28, difficulty: 15, level_path: 'levels/three_move/task_8.txt'),
  GameLevelThreeMove(number: 29, difficulty: 15, level_path: 'levels/three_move/task_9.txt'),
  GameLevelThreeMove(number: 30, difficulty: 15, level_path: 'levels/three_move/task_10.txt'),
];

class GameLevelThreeMove {
  final int number;

  final int difficulty;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  final String level_path;

  bool get awardsAchievement => achievementIdAndroid != null;

  const GameLevelThreeMove({
    required this.number,
    required this.difficulty,
    this.achievementIdIOS,
    this.achievementIdAndroid,
    required this.level_path,
  }) : assert(
            (achievementIdAndroid != null && achievementIdIOS != null) ||
                (achievementIdAndroid == null && achievementIdIOS == null),
            'Either both iOS and Android achievement ID must be provided, '
            'or none');
}
