import 'package:camera_sample_redux/domain/action/camera/preview/error/error_initialization_camera_action.dart';
import 'package:camera_sample_redux/domain/action/camera/preview/init/initialization_camera_action.dart';
import 'package:camera_sample_redux/domain/action/camera/preview/show/complete_initialization_camera_action.dart';
import 'package:camera_sample_redux/domain/state/camera/preview/initialization_camera_state.dart';
import 'package:camera_sample_redux/domain/state/camera/preview/preview_state.dart';
import 'package:redux/redux.dart';

// TODO?
final previewReducers = combineReducers<PreviewState>([
  TypedReducer<PreviewState, InitializationCameraAction>(_setLoadingState),
  TypedReducer<PreviewState, CompleteInitializationCameraAction>(_setCompleteState),
  TypedReducer<PreviewState, ErrorInitializationCameraAction>(_setErrorState),
]);


PreviewState _setLoadingState(PreviewState state, InitializationCameraAction action) =>
    state.copyWith(cameraState: InitializationCameraState.LOADING);

PreviewState _setCompleteState(PreviewState state, CompleteInitializationCameraAction action) =>
    state.copyWith(cameraState: InitializationCameraState.COMPLETE, controller: action.controller);

PreviewState _setErrorState(PreviewState state, ErrorInitializationCameraAction action) =>
    state.copyWith(cameraState: InitializationCameraState.ERROR);