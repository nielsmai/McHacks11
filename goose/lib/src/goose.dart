import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/components.dart';
import 'config.dart';
import 'dart:math' as math;

enum PlayState { welcome, playing, gameOver, won }

class Goose extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents, TapDetector {
  Goose()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  final ValueNotifier<int> score = ValueNotifier(0);
  final rand = math.Random();
  double get width => size.x;
  double get height => size.y;

  late Cloudberry _cb;

  late PlayState _playState;
  PlayState get playState => _playState;
  set playState(PlayState playState) {
    _playState = playState;
    switch (playState) {
      case PlayState.welcome:
      case PlayState.gameOver:
      case PlayState.won:
        overlays.add(playState.name);
      case PlayState.playing:
        overlays.remove(PlayState.welcome.name);
        overlays.remove(PlayState.gameOver.name);
        overlays.remove(PlayState.won.name);
    }
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;
    
    _cb = Cloudberry(
      // position: Vector2(128, canvasSize.y - 70),
      position: Vector2(128, 128),
    );
    world.add(PlayArea());

    playState = PlayState.welcome; // Add from here...
  }

  void startGame() {
    if (playState == PlayState.playing) return;
    playState = PlayState.playing;
    score.value = 0;

    world.add(_cb);
  }

  @override
  void onTap() {
    super.onTap();
    if (playState == PlayState.welcome) {
      startGame();
    }
  }

  @override
  Color backgroundColor() => const Color(0xfff2e8cf);
}
