// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const gameLevelsTwoMove = [
  GameLevelTwoMove(number: 11, difficulty: 10, level_path: 'levels/two_move/task_1.txt'),
  GameLevelTwoMove(number: 12, difficulty: 10, level_path: 'levels/two_move/task_2.txt'),
  GameLevelTwoMove(number: 13, difficulty: 10, level_path: 'levels/two_move/task_3.txt'),
  GameLevelTwoMove(number: 14, difficulty: 10, level_path: 'levels/two_move/task_4.txt'),
  GameLevelTwoMove(number: 15, difficulty: 10, level_path: 'levels/two_move/task_5.txt'),
  GameLevelTwoMove(number: 16, difficulty: 10, level_path: 'levels/two_move/task_6.txt'),
  GameLevelTwoMove(number: 17, difficulty: 10, level_path: 'levels/two_move/task_7.txt'),
  GameLevelTwoMove(number: 18, difficulty: 10, level_path: 'levels/two_move/task_8.txt'),
  GameLevelTwoMove(number: 19, difficulty: 10, level_path: 'levels/two_move/task_9.txt'),
  GameLevelTwoMove(number: 20, difficulty: 10, level_path: 'levels/two_move/task_10.txt'),
];

class GameLevelTwoMove {
  final int number;

  final int difficulty;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  final String level_path;

  bool get awardsAchievement => achievementIdAndroid != null;

  const GameLevelTwoMove({
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
