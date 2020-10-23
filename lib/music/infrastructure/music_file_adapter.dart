import 'dart:io';

import '../domain/obtain_musics.dart';

class MusicFileAdapter implements ObtainMusics {
  final path = 'storage/emulated/0/Music';

  @override
  List<FileSystemEntity> getMusics() => Directory(path).listSync();
}
