import 'package:ball_bounce/brick_breaker.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class Board extends RectangleComponent
    with DragCallbacks, HasGameRef<BrickBreaker> {
  Board() : super(paint: Paint()..color = Colors.black);
}
