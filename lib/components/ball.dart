import 'dart:math';

import 'package:ball_bounce/brick_breaker.dart';
import 'package:ball_bounce/components/board.dart';
import 'package:ball_bounce/utils/constants.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameRef<BrickBreaker> {
  Ball()
      : super(
          paint: Paint()..color = const Color(ballColor),
          radius: ballRadius,
          children: [CircleHitbox()],
        );
  BallState ballState = BallState.ideal;
  double speed = 1;

  static const degree = pi / 180;
  double xDirection = 0;
  double yDirection = 0;

  final nextPosition = Vector2.zero();

  double aimAngle = 0;
  Vector2 aimTriangleMidPoint = Vector2.zero();
  Vector2 aimTriangleBasePoint = Vector2.zero();
  List<Rect> aimPointerBalls = [];
  final aimPainter = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  @override
  Future<void> onLoad() {
    // resetBall();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (position.y >= gameRef.board.size.y - size.y) {
      position.setFrom(
        Vector2(
          position.x,
          (gameRef.board.size.y - radius * 2) - 2,
        ),
      );
      ballState = BallState.completed;
      speed = 1;
    }

    if (ballState == BallState.release) {
      // moveBall(dt);
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    if (ballState == BallState.drag) {
      // drawRotatedObject();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    ballState = BallState.ideal;

    super.onCollisionStart(intersectionPoints, other);

    if (other is Board) {
      // reflectFromBoard
    }
  }
}
