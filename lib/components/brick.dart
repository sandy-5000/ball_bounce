import 'package:ball_bounce/brick_breaker.dart';
import 'package:ball_bounce/utils/constants.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ball.dart';

class Brick extends PositionComponent
    with CollisionCallbacks, HasGameRef<BrickBreaker> {
  int brickValue;
  bool hasCollided = false;

  Brick({
    required this.brickValue,
    required double size,
  }) : super(size: Vector2.all(size));

  late final TextComponent brickText;
  late final RectangleHitbox rectanglHitbox;
  late final RectangleComponent rectangleBrick;

  @override
  Future<void> onLoad() async {
    if (brickValue <= 0) {
      removeFromParent();
      return;
    }
    brickText = createBrickTextComponent();
    rectanglHitbox = createRectangleHitBox();
    rectangleBrick = createBrickComponent();

    addAll([
      brickText,
      rectanglHitbox,
      rectangleBrick,
    ]);
  }

  @override
  void update(double dt) {
    if (hasCollided) {
      brickText.text = "$brickValue";
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Ball && !isColliding) {
      hasCollided = true;
      handleCollision();
    }
    super.onCollision(intersectionPoints, other);
  }

  TextComponent createBrickTextComponent() {
    return TextComponent(
      text: "$brickValue",
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Color(brickFontColor),
          fontSize: brickFontSize,
        ),
      ),
    )..center = size / 2;
  }

  RectangleHitbox createRectangleHitBox() {
    return RectangleHitbox(
      size: size,
    );
  }

  RectangleComponent createBrickComponent() {
    return RectangleComponent(
      size: size,
      paint: Paint()
        ..style = PaintingStyle.fill
        ..color = const Color(brickColor),
    );
  }

  void handleCollision() {
    if (--brickValue == 0) {
      removeFromParent();
      return;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if (hasCollided) {
      hasCollided = false;
    }
    super.onCollisionEnd(other);
  }
}
