class DemoLazyLoadRepository {
  Future<List<int>> getDummyList({required int dummyPage}) async {
    /// TODO set random error
    if (dummyPage == 5) return <int>[];
    const generatedCount = 10;
    await Future.delayed(const Duration(seconds: 500));
    return List<int>.generate(generatedCount, (index) => dummyPage + index)
        .toList();
  }
}
