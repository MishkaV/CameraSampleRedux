import 'package:camera/camera.dart';
import 'package:camera_sample_redux/di/assemble.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/init/error/error_initialization_camera_action.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/init/initialization_camera_action.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/show/complete_initialization_camera_action.dart';
import 'package:camera_sample_redux/domain/state/global/global_state.dart';
import 'package:redux/src/store.dart';
import 'package:redux_thunk/redux_thunk.dart';

class OnInitializationCameraAction
    extends CallableThunkActionWithExtraArgument<GlobalState, Assemble> {
  final CameraLensDirection cameraLensDirection;
  final ResolutionPreset resolutionPreset;

  OnInitializationCameraAction({
    this.cameraLensDirection = CameraLensDirection.back,
    this.resolutionPreset = ResolutionPreset.max,
  });

  // TODO DISPOSE ACTION!!!!
  @override
  call(Store<GlobalState> store, Assemble service) async {
    store.dispatch(InitializationCameraAction());
    try {
      var controller = await service.cameraUtils.getCameraController(
        cameraLensDirection,
        resolutionPreset,
      );
      await controller.initialize();
      store.dispatch(CompleteInitializationCameraAction(controller));
    } catch (error) {
      store.dispatch(ErrorInitializationCameraAction(error: error.toString()));
    }
  }
}
