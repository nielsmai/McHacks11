import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:goose/squirrel.dart';

// import 'level1.dart';

void main() {
  runApp(
    const GameWidget<SpriteSheetExample>.controlled(
      gameFactory: SpriteSheetExample.new,
    ),
  );
}
