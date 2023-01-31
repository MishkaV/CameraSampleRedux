import 'package:camera_sample_redux/domain/state/camera/flash/flash_state.dart';
import 'package:camera_sample_redux/domain/state/camera/gallery/gallery_state.dart';
import 'package:camera_sample_redux/domain/state/camera/preview/preview_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../../di/assemble.dart';
import '../../reducer/global/global_reducer.dart';

final globalStore = Store<GlobalState>(globalReducer,
    initialState: GlobalState.initState,
    middleware: [ExtraArgumentThunkMiddleware(Assemble())]);

class GlobalState {
  static GlobalState initState = GlobalState(
    PreviewState.empty,
    GalleryState.empty,
    FlashState.empty,
  );

  // TODO Maybe group?
  final PreviewState previewState;
  final GalleryState galleryState;
  final FlashState flashState;

  const GlobalState(
    this.previewState,
    this.galleryState,
    this.flashState,
  );
}
