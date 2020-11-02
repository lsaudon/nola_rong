import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionWidget extends StatefulWidget {
  const PermissionWidget({
    Key key,
    this.permission,
    this.builder,
  }) : super(key: key);

  final Permission permission;
  final WidgetBuilder builder;

  @override
  _PermissionWidgetState createState() => _PermissionWidgetState();
}

class _PermissionWidgetState extends State<PermissionWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.permission.request(),
      builder: (context, snapshot) {
        debugPrint(snapshot.toString());
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return widget.builder(context);
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
          default:
            return const SizedBox();
        }
      },
    );
  }
}
