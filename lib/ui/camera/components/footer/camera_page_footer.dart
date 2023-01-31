import 'package:camera_sample_redux/domain/action/camera/camera/change/on_change_camera_action.dart';
import 'package:camera_sample_redux/domain/action/camera/camera/take_photo/on_take_photo_action.dart';
import 'package:camera_sample_redux/domain/state/global/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'helpers/ButtonCreateHelpers.dart';

class CameraPageFooter extends StatelessWidget {
  const CameraPageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        createIconButton(iconPath: "assets/icons/camera/flash_on.png"),
        createIconButton(
          iconPath: "assets/icons/camera/change_camera.png",
          onPressed: () => StoreProvider.of<GlobalState>(context)
              .dispatch(OnChangeCameraAction()),
        ),
        createIconButton(
          iconPath: "assets/icons/camera/take_photo_button.png",
          iconWidth: 100.0,
          iconHeight: 104.0,
          backgroundColor: null,
          onPressed: () => StoreProvider.of<GlobalState>(context)
              .dispatch(OnTakePhotoAction()),
        ),
        createTextButton(text: "1x"),
        createImageButton(), // TODO onPress?
      ],
    );
  }
}
