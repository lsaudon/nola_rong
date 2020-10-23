import 'dart:io';

import 'package:flutter_riverpod/all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nola_rong/main.dart';
import 'package:nola_rong/music/domain/obtain_musics.dart';

class FakeObtainMusicsAdapter implements ObtainMusics {
  @override
  List<FileSystemEntity> getMusics() {
    return <FileSystemEntity>[File('mypath')];
  }
}

void main() {
  testWidgets('when launch app then show musics path', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          obtainMusicsProvider.overrideWithProvider(
            Provider((ref) => FakeObtainMusicsAdapter()),
          ),
        ],
        child: const MyApp(),
      ),
    );
    expect(find.text('mypath'), findsOneWidget);
  });
}
