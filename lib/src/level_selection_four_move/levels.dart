// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const gameLevelsFourMove = [
  GameLevelFourMove(number: 31, difficulty: 20, level_path: 'levels/four_move/task_1.txt'),
  GameLevelFourMove(number: 32, difficulty: 20, level_path: 'levels/four_move/task_2.txt'),
  GameLevelFourMove(number: 33, difficulty: 20, level_path: 'levels/four_move/task_3.txt'),
  GameLevelFourMove(number: 34, difficulty: 20, level_path: 'levels/four_move/task_4.txt'),
  GameLevelFourMove(number: 35, difficulty: 20, level_path: 'levels/four_move/task_5.txt'),
  GameLevelFourMove(number: 36, difficulty: 20, level_path: 'levels/four_move/task_6.txt'),
  GameLevelFourMove(number: 37, difficulty: 20, level_path: 'levels/four_move/task_7.txt'),
  GameLevelFourMove(number: 38, difficulty: 20, level_path: 'levels/four_move/task_8.txt'),
  GameLevelFourMove(number: 39, difficulty: 20, level_path: 'levels/four_move/task_9.txt'),
  GameLevelFourMove(number: 40, difficulty: 20, level_path: 'levels/four_move/task_10.txt'),
];

class GameLevelFourMove {
  final int number;

  final int difficulty;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  final String level_path;

  bool get awardsAchievement => achievementIdAndroid != null;

  const GameLevelFourMove({
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
