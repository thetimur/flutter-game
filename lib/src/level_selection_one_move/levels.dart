// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const gameLevelsOneMove = [
  GameLevelOneMove(number: 1, difficulty: 5, level_path: 'levels/one_move/task_1.txt'),
  GameLevelOneMove(number: 2, difficulty: 5, level_path: 'levels/one_move/task_2.txt'),
  GameLevelOneMove(number: 3, difficulty: 5, level_path: 'levels/one_move/task_3.txt'),
  GameLevelOneMove(number: 4, difficulty: 5, level_path: 'levels/one_move/task_4.txt'),
  GameLevelOneMove(number: 5, difficulty: 5, level_path: 'levels/one_move/task_5.txt'),
  GameLevelOneMove(number: 6, difficulty: 5, level_path: 'levels/one_move/task_6.txt'),
  GameLevelOneMove(number: 7, difficulty: 5, level_path: 'levels/one_move/task_7.txt'),
  GameLevelOneMove(number: 8, difficulty: 5, level_path: 'levels/one_move/task_8.txt'),
  GameLevelOneMove(number: 9, difficulty: 5, level_path: 'levels/one_move/task_9.txt'),
  GameLevelOneMove(number: 10, difficulty: 5, level_path: 'levels/one_move/task_10.txt'),
];

class GameLevelOneMove {
  final int number;

  final int difficulty;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  final String level_path;

  bool get awardsAchievement => achievementIdAndroid != null;

  const GameLevelOneMove({
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
