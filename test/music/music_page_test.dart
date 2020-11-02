import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nola_rong/bootstrapper.dart';
import 'package:nola_rong/main.dart';
import 'package:nola_rong/music/domain/obtain_musics.dart';
import 'package:permission_handler/permission_handler.dart';

class FakeObtainMusicsAdapter implements ObtainMusics {
  @override
  List<FileSystemEntity> getMusics() {
    return <FileSystemEntity>[File('mypath')];
  }
}

void main() {
  testWidgets('when launch app then show musics path', (tester) async {
    const MethodChannel('flutter.baseflow.com/permissions/methods')
        .setMockMethodCallHandler(
      (methodCall) async {
        if (methodCall.method == 'requestPermissions') {
          return PermissionStatus.granted;
        }
        return null;
      },
    );

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

    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.text('mypath'), findsNothing);
    await tester.pump();
    expect(find.byType(SizedBox), findsNothing);
    expect(find.text('mypath'), findsOneWidget);
  });
}
