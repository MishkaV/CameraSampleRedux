
class GalleryState {
  final String? currentPath;

  static GalleryState empty = GalleryState(null);

  GalleryState(this.currentPath);

  GalleryState copyWith({
    String? currentPath,
  }) =>
      GalleryState(
        currentPath ?? this.currentPath,
      );
}
