import 'package:camera_sample_redux/di/assemble.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/zoom/on_change_zoom_action.dart';
import 'package:camera_sample_redux/domain/state/global/global_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class OnLoopedChangeZoomAction
    extends CallableThunkActionWithExtraArgument<GlobalState, Assemble> {
  OnLoopedChangeZoomAction();

  // TODO Try catch?

  double _roundedZoom(double zoom) => double.parse((zoom).toStringAsFixed(1));

  @override
  call(Store<GlobalState> store, Assemble service) async {
    var zoomLevel = store.state.zoomState.currentZoomLevel + 1.0 >=
            store.state.zoomState.maxZoomLevel
        ? store.state.zoomState.minZoomLevel
        : store.state.zoomState.currentZoomLevel + 1.0;

    store.dispatch(OnChangeZoomAction(_roundedZoom(zoomLevel)));
  }
}
