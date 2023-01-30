import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

Future<Widget> createImageButton({
  double iconWidth = 36.0,
  double iconHeight = 36.0,
  Color? backgroundColor = Colors.white,
  void Function()? onPressed,
}) async {
  // TODO....
  final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
  final List<AssetEntity> entities =
      await paths.first.getAssetListPaged(page: 0, size: 1);
  final photo = entities.first;

  // TODO Color depends on theme
  return _createBaseContainer(
    iconWidth: iconWidth,
    iconHeight: iconHeight,
    backgroundColor: backgroundColor,
    child: IconButton(
      onPressed: onPressed,
      icon: Image(
        image: AssetEntityImageProvider(
          photo,
          isOriginal: false,
          thumbnailSize: const ThumbnailSize.square(200),
          thumbnailFormat: ThumbnailFormat.jpeg,
        ),
      ),
    ),
  );
}

Widget createIconButton({
  required String iconPath,
  double iconWidth = 36.0,
  double iconHeight = 36.0,
  Color? backgroundColor = Colors.white,
  void Function()? onPressed,
}) {
  // TODO Color depends on theme
  return _createBaseContainer(
    iconWidth: iconWidth,
    iconHeight: iconHeight,
    backgroundColor: backgroundColor,
    child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          iconPath,
          width: iconWidth,
          height: iconHeight,
          fit: BoxFit.fitHeight,
        )),
  );
}

Widget createTextButton({
  required String text,
  double iconWidth = 36.0,
  double iconHeight = 36.0,
  Color? backgroundColor = Colors.white,
  void Function()? onPressed,
}) {
  // TODO Color depends on theme
  return _createBaseContainer(
    iconWidth: iconWidth,
    iconHeight: iconHeight,
    backgroundColor: backgroundColor,
    child: Center(
      child: Text(
        text,
        style: TextStyle(
            color: Colors.black, fontSize: 16.0), // TODO Depence on theme
      ),
    ),
  );
}

Widget _createBaseContainer({
  required Widget child,
  double iconWidth = 36.0,
  double iconHeight = 36.0,
  Color? backgroundColor = Colors.white,
}) {
  return Container(
    width: iconWidth,
    height: iconHeight,
    decoration: backgroundColor != null
        ? BoxDecoration(color: backgroundColor, shape: BoxShape.circle)
        : null,
    child: child,
  );
}
