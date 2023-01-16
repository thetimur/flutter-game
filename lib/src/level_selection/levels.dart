// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const gameLevels = [
  GameLevel(
      number: 1,
      difficulty: 5,
      // You configure this in App Store Connect.
      achievementIdIOS: 'first_win',
      // You get this string when you configure an achievement in Play Console.
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      level_path: 'levels/one_move/task_1.txt'),
  GameLevel(number: 2, difficulty: 42, level_path: 'levels/one_move/task_2.txt'),
  GameLevel(
      number: 3,
      difficulty: 100,
      achievementIdIOS: 'finished',
      achievementIdAndroid: 'CdfIhE96aspNWLGSQg',
      level_path: 'levels/one_move/task_3.txt'),
];

class GameLevel {
  final int number;

  final int difficulty;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  final String level_path;

  bool get awardsAchievement => achievementIdAndroid != null;

  const GameLevel({
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
