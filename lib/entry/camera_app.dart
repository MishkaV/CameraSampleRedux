import 'package:camera_sample_redux/domain/state/global/global_state.dart';
import 'package:camera_sample_redux/ui/camera/camera_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CameraApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  var _dark = false;

  @override
  Widget build(BuildContext context) => StoreProvider<GlobalState>(
        store: globalStore,
        child: MaterialApp(
          theme:
              ThemeData(brightness: _dark ? Brightness.dark : Brightness.light),
          home: CameraPage(),
        ),
      );
}
