import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../bootstrapper.dart';
import '../../permission/presentation/permission_widget.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key key}) : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Musics'),
      ),
      body: PermissionWidget(
        permission: Permission.storage,
        builder: (context) {
          final _files = context.read(obtainMusicsProvider).getMusics();
          return ListView.builder(
            itemCount: _files.length,
            itemBuilder: (context, index) {
              final file = _files[index];
              return ListTile(
                title: Text(file.path),
              );
            },
          );
        },
      ),
    );
  }
}
