import 'package:camera/camera.dart';
import 'package:camera_sample_redux/di/assemble.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/init/on_initialization_camera_action.dart';
import 'package:camera_sample_redux/domain/state/global/global_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class OnChangeCameraAction
    extends CallableThunkActionWithExtraArgument<GlobalState, Assemble> {
  @override
  call(Store<GlobalState> store, Assemble service) async {
    var cameraLensDirection =
        store.state.previewState.controller?.description.lensDirection ==
                CameraLensDirection.back
            ? CameraLensDirection.front
            : CameraLensDirection.back;

    store.dispatch(OnInitializationCameraAction(cameraLensDirection: cameraLensDirection));
  }
}
