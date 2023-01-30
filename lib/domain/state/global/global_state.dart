
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../../di/assemble.dart';
import '../../reducer/global/global_reducer.dart';
import '../camera/preview/preview_state.dart';

final globalStore = Store<GlobalState>(globalReducer,
    initialState: GlobalState.initState,
    middleware: [ExtraArgumentThunkMiddleware(Assemble())]);

class GlobalState {
  static GlobalState initState = GlobalState(PreviewState.empty);

  final PreviewState preview;

  const GlobalState(this.preview);
}
