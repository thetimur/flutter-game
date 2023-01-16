// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const gameLevelsFight = [
  GameLevelFight(number: 41, difficulty: 100, level_path: 'levels/pawn_fight.txt'),
  GameLevelFight(number: 42, difficulty: 100, level_path: 'levels/rook_fight.txt'),
  GameLevelFight(number: 43, difficulty: 100, level_path: 'levels/knight_fight.txt'),
];

class GameLevelFight {
  final int number;

  final int difficulty;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  final String level_path;

  bool get awardsAchievement => achievementIdAndroid != null;

  const GameLevelFight({
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
