import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SpriteSheetExample extends FlameGame with KeyboardEvents {
  static const String description = '''
    In this example we show how to load images and how to create animations from
    sprite sheets.
  ''';

  // Speed at which cb moves.
  static const double _speed = 500;
  // Direction in which cb is moving.
  final Vector2 _direction = Vector2.zero();
  var position = Vector2.zero();
  var vampireComponent = SpriteAnimationComponent();

  @override
  Future<void> onLoad() async {
    final spriteSheet = SpriteSheet(
        image: await images.load('Squirrel.png'), srcSize: Vector2(21.0, 19.0));

    final vampireAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: 0.1, to: 5);

    final spriteSize = Vector2(100.0, 100.0); //absolute size on the screen

    vampireComponent = SpriteAnimationComponent(
      animation: vampireAnimation,
      position: position, //position on the screen
      size: spriteSize,
    );

    add(vampireComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    final displacement = _direction.normalized() * _speed * dt;
    position += displacement;
    print(position);
    vampireComponent.position = position;
    add(vampireComponent);
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is RawKeyDownEvent;

    // Avoiding repeat event as we are interested only in
    // key up and key down event.
    if (!event.repeat) {
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        _direction.x += isKeyDown ? -1 : 1;
        print('left');
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        _direction.x += isKeyDown ? 1 : -1;
        if (isKeyDown) {
          print('right');
        }
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        _direction.y += isKeyDown ? -1 : 1;
        print('up');
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        _direction.y += isKeyDown ? 1 : -1;
        print('down');
      }
    }

    return super.onKeyEvent(event, keysPressed);
  }
}
