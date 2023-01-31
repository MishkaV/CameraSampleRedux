import 'package:camera_sample_redux/di/assemble.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/zoom/change_zoom_level_action.dart';
import 'package:camera_sample_redux/domain/state/global/global_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class OnChangeZoomAction
    extends CallableThunkActionWithExtraArgument<GlobalState, Assemble> {
  final double zoomLevel;

  OnChangeZoomAction(this.zoomLevel);

  // TODO Try catch?
  @override
  call(Store<GlobalState> store, Assemble service) async {

    if (zoomLevel >= store.state.zoomState.minZoomLevel && zoomLevel <= store.state.zoomState.maxZoomLevel){
      await store.state.previewState.controller?.setZoomLevel(zoomLevel);
      store.dispatch(ChangeZoomLevelAction(zoomLevel));
    }
  }
}
