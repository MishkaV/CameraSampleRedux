import 'package:camera/camera.dart';

class FlashState {
  final FlashMode currentMode;

  static FlashState empty = FlashState(FlashMode.off);

  FlashState(this.currentMode);

  FlashState copyWith({
    FlashMode? currentMode,
  }) =>
      FlashState(
        currentMode ?? this.currentMode,
      );
}
