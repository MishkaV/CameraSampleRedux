import 'package:camera_sample_redux/domain/reducer/camera/preview/preview_reducer.dart';
import 'package:camera_sample_redux/domain/state/global/global_state.dart';

GlobalState globalReducer(GlobalState state, action) =>
    GlobalState(previewReducers(state.preview, action));
