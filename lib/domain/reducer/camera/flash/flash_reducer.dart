import 'package:camera_sample_redux/domain/action/camera/camera/flash/change_flash_action.dart';
import 'package:camera_sample_redux/domain/state/camera/flash/flash_state.dart';
import 'package:redux/redux.dart';

// TODO?
final flashReducers = combineReducers<FlashState>([
  TypedReducer<FlashState, ChangeFlashAction>(_changeFlashState),
]);

FlashState _changeFlashState(FlashState state, ChangeFlashAction action) =>
    state.copyWith(currentMode: action.mode);