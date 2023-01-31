import 'package:camera_sample_redux/domain/action/camera/camera/take_photo/take_photo_action.dart';
import 'package:camera_sample_redux/domain/state/camera/gallery/gallery_state.dart';
import 'package:redux/redux.dart';

// TODO?
final galleryReducers = combineReducers<GalleryState>([
  TypedReducer<GalleryState, CompleteTakePhotoAction>(_setPhotoPath),
]);

GalleryState _setPhotoPath(GalleryState state, CompleteTakePhotoAction action) =>
    state.copyWith(currentPath: action.path);