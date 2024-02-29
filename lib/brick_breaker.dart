import 'package:ball_bounce/components/ball.dart';
import 'package:ball_bounce/components/board.dart';
import 'package:ball_bounce/managers/game_manager.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class BrickBreaker extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  BrickBreaker({super.children});

  final GameManager gameManager = GameManager();
  final Ball ball = Ball();
  final Board board = Board();
}
