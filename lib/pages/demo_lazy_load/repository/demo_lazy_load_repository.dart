import 'dart:math';

import 'package:mr_white/generated/l10n.dart';

class DemoLazyLoadRepository {
  Future<List<int>> getDummyList({required int dummyPage}) async {
    final isFailure = Random().nextBool();
    if (isFailure) {
      throw Exception(S.current.errorFetchingPosts);
    }
    if (dummyPage == 5) return <int>[];
    const generatedCount = 10;
    await Future.delayed(const Duration(seconds: 2));
    return List<int>.generate(generatedCount, (index) => dummyPage + index)
        .toList();
  }
}
