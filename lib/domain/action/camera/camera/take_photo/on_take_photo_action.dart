import 'package:camera_sample_redux/di/assemble.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/take_photo/error/error_take_photo_action.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/take_photo/take_photo_action.dart';
import 'package:camera_sample_redux/domain/state/global/global_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class OnTakePhotoAction
    extends CallableThunkActionWithExtraArgument<GlobalState, Assemble> {
  @override
  call(Store<GlobalState> store, Assemble service) async {
    // TODO More states?
    try {
      final path =
          await store.state.previewState.controller?.takePicture();

      if (path != null) {
        store.dispatch(CompleteTakePhotoAction(path.path));
      } else {
        store.dispatch(ErrorTakePhotoAction(error: "Path is null"));
      }
    } catch (error) {
      store.dispatch(ErrorTakePhotoAction(error: error.toString()));
    }
  }
}
