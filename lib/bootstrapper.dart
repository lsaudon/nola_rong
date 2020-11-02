import 'package:flutter_riverpod/all.dart';

import 'music/domain/obtain_musics.dart';
import 'music/infrastructure/music_file_adapter.dart';

final obtainMusicsProvider =
    Provider<ObtainMusics>((ref) => MusicFileAdapter());
