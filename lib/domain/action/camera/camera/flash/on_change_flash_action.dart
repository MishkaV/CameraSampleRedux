import 'package:camera/camera.dart';
import 'package:camera_sample_redux/di/assemble.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/flash/change_flash_action.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/init/on_initialization_camera_action.dart';
import 'package:camera_sample_redux/domain/state/global/global_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class OnChangeFlashAction
    extends CallableThunkActionWithExtraArgument<GlobalState, Assemble> {
  @override
  call(Store<GlobalState> store, Assemble service) async {

    var flashMode = store.state.flashState.currentMode == FlashMode.off
        ? FlashMode.torch
        : FlashMode.off;

    await store.state.previewState.controller?.setFlashMode(flashMode);
    store.dispatch(ChangeFlashAction(flashMode));
  }
}
