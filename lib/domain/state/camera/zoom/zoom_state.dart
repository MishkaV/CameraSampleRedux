
class ZoomState {
  final double minZoomLevel;
  final double currentZoomLevel;
  final double maxZoomLevel;

  static ZoomState empty = ZoomState(
    1.0,
    1.0,
    1.0,
  );

  ZoomState(this.minZoomLevel, this.currentZoomLevel, this.maxZoomLevel);

  ZoomState copyWith({
    double? minZoomLevel,
    double? currentZoomLevel,
    double? maxZoomLevel,
  }) =>
      ZoomState(
        minZoomLevel ?? this.minZoomLevel,
        currentZoomLevel ?? this.currentZoomLevel,
        maxZoomLevel ?? this.maxZoomLevel,
      );
}
