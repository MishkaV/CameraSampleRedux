import 'package:camera_sample_redux/domain/state/camera/preview/preview_state.dart';
import 'package:camera_sample_redux/ui/camera/components/preview/camera_page_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../../domain/state/global/global_state.dart';

class CameraPreviewState extends State<CameraPagePreview> {
  // TODO Permissions?

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 28.0, 8.0, 16.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(36)),
        child: StoreConnector<GlobalState, PreviewState>(
          distinct: true,
          converter: (store) => store.state.previewState,
          builder: (context, state) {
            return state.controller?.buildPreview() ?? Container();
          },
        ),
      ),
    );
  }
}
