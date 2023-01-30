import 'package:camera/camera.dart';

import 'initialization_camera_state.dart';

class PreviewState {
  final CameraController? controller;
  final InitializationCameraState cameraState;

  static PreviewState empty = PreviewState(
    null,
    InitializationCameraState.NONE,
  );

  PreviewState(
    this.controller,
    this.cameraState,
  );

  PreviewState copyWith({
    CameraController? controller,
    InitializationCameraState? cameraState,
  }) =>
      PreviewState(
        controller ?? this.controller,
        cameraState ?? this.cameraState,
      );
}
