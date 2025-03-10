import 'package:cool_flare/flare.dart';
import 'package:cool_flare/flare_controller.dart';

class SingleLoopController extends FlareController {
  final String _animation;
  final double _loopAmount;
  final double _mix;
  ActorAnimation? _actor;
  double _duration = 0;
  double _loopCount = 0;

  SingleLoopController(this._animation, this._loopAmount, [this._mix = 0.7]);

  @override
  void initialize(FlutterActorArtboard artboard) {
    _actor = artboard.getAnimation(_animation);
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    if (_loopCount >= _loopAmount) {
      // Looped enough times!
      _actor!.apply(_actor!.duration, artboard, 1);
      return false;
    }
    _duration += elapsed;

    if (_duration >= _actor!.duration) {
      // Loop!
      _loopCount++;
      _duration %= _actor!.duration;
    }
    _actor!.apply(_duration, artboard, _mix);
    return true;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}
