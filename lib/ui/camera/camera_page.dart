import 'package:camera_sample_redux/domain/action/camera/camera/init/on_initialization_camera_action.dart';
import 'package:camera_sample_redux/domain/state/camera/preview/initialization_camera_state.dart';
import 'package:camera_sample_redux/domain/state/global/global_state.dart';
import 'package:camera_sample_redux/ui/camera/camera_page_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'error/error_screen.dart';

class CameraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  Future<void> onInit() async {
    StoreProvider.of<GlobalState>(context)
        .dispatch(OnInitializationCameraAction());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    onInit();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StoreConnector<GlobalState, InitializationCameraState>(
          distinct: true,
          converter: (store) =>
              store.state.previewState.cameraState,
          builder: (context, state) {
            if (state == InitializationCameraState.ERROR) {
              return const ErrorScreen();
            }

            if (state == InitializationCameraState.COMPLETE) {
              return CameraPageContent();
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
