import 'package:camera_sample_redux/domain/action/camera/camera/flash/change_flash_action.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/zoom/change_zoom_level_action.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/zoom/new_zoom_level_action.dart';
import 'package:camera_sample_redux/domain/state/camera/flash/flash_state.dart';
import 'package:camera_sample_redux/domain/state/camera/zoom/zoom_state.dart';
import 'package:redux/redux.dart';

// TODO?
final zoomReducers = combineReducers<ZoomState>([
  TypedReducer<ZoomState, NewZoomLevelAction>(_setZoomLevels),
  TypedReducer<ZoomState, ChangeZoomLevelAction>(_changeCurrentZoomLevel),
]);

ZoomState _setZoomLevels(
  ZoomState state,
  NewZoomLevelAction action,
) =>
    state.copyWith(
      minZoomLevel: action.minZoomLevel,
      currentZoomLevel: action.currentZoomLevel,
      maxZoomLevel: action.maxZoomLevel,
    );

ZoomState _changeCurrentZoomLevel(
  ZoomState state,
  ChangeZoomLevelAction action,
) =>
    state.copyWith(currentZoomLevel: action.zoomLevel);
