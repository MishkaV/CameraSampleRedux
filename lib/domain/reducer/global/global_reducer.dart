import 'package:camera_sample_redux/domain/reducer/camera/flash/flash_reducer.dart';
import 'package:camera_sample_redux/domain/reducer/camera/gallery/gallery_reducer.dart';
import 'package:camera_sample_redux/domain/reducer/camera/preview/preview_reducer.dart';
import 'package:camera_sample_redux/domain/reducer/camera/zoom/zoom_reducer.dart';
import 'package:camera_sample_redux/domain/state/global/global_state.dart';

GlobalState globalReducer(GlobalState state, action) => GlobalState(
      previewReducers(state.previewState, action),
      galleryReducers(state.galleryState, action),
      flashReducers(state.flashState, action),
      zoomReducers(state.zoomState, action),
    );
