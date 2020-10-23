import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'music/domain/obtain_musics.dart';
import 'music/infrastructure/music_file_adapter.dart';
import 'music/presentation/music_page.dart';

final obtainMusicsProvider =
    Provider<ObtainMusics>((ref) => MusicFileAdapter());

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MusicPage(),
    );
  }
}
