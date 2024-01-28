import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:goose/src/goose.dart';

class Cloudberry extends SpriteAnimationComponent
    with KeyboardHandler, HasGameReference<Goose> {
  Cloudberry({
    required super.position,
  }) : super(size: Vector2(21.0, 19.0), anchor: Anchor.center);

  var cbComponent = SpriteAnimationComponent();
  // Speed at which cb moves.
  static const double _speed = 300;
  // Direction in which cb is moving.
  final Vector2 _direction = Vector2.zero();
  var facing = -1;
  @override
  onLoad() async {
    final spriteSheet = SpriteSheet(
        image: await Flame.images.load('Squirrel.png'),
        srcSize: Vector2(21.0, 19.0));

    final cbAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: 0.1, to: 5);

    final spriteSize = Vector2(100.0, 100.0); //absolute size on the screen

    cbComponent = SpriteAnimationComponent(
      animation: cbAnimation,
      position: position, //position on the screen
      size: spriteSize,
    );

    add(cbComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);

    final displacement = _direction.normalized() * _speed * dt;
    position += displacement;

    if(facing < 0) {
      cbComponent.flipHorizontallyAroundCenter();
    }
    add(cbComponent);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;

    // Avoiding repeat event as we are interested only in
    // key up and key down event.
    if (!event.repeat) {
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        if (facing < 0) {
          cbComponent.flipHorizontallyAroundCenter();
          facing = -1;
        }
        _direction.x += isKeyDown ? -1 : 1;
        print('left');
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        _direction.x += isKeyDown ? 1 : -1;
        if (facing > 0) {
          cbComponent.flipHorizontallyAroundCenter();
          facing = 1;
        }
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
