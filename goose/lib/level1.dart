import 'package:flame/game.dart';
// import 'package:flame/components.dart';
// import 'package:flame/flame.dart';
// import 'package:flame/sprite.dart';

// class GooseGame extends FlameGame {
//   late SpriteAnimation a;
//   late Image i;

//   GooseGame() {
//     _loadSprite();

//     const amountOfFrames = 5;
//     a = SpriteAnimation.fromFrameData(
//       imageInstance,
//       SpriteAnimationFrame.sequenced(
//         amount: amountOfFrames,
//         textureSize: Vector2(16.0, 16.0),
//         stepTime: 0.1,
//       ),
//     );
//   }

//   void update(double dt) {
//     a.update(dt);
//   }

//   void render(Canvas c) {
//     a.getSprite().render(c);
//   }

//   late SpriteComponent _spriteComponent;

//   // @override
//   // Future<void> onLoad() async {
//   //   final image = await images.load('Squirrel.png');
//   //   Sprite player = Sprite(image);

//   // }

//   void _loadSprite() async {
//     var image = await Flame.images.load('Squirrel.png');
//     _spriteComponent = SpriteComponent.fromImage(image);
//     add(_spriteComponent);
//   }

//   // camera.viewfinder.anchor = Anchor.topLeft;
// }
