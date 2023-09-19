import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mr_white/pages/demo_lazy_load/bloc/demo_lazy_load_bloc.dart';
import 'package:mr_white/pages/demo_lazy_load/repository/demo_lazy_load_repository.dart';

class MockDemoLazyLoadRepository extends Mock
    implements DemoLazyLoadRepository {}

void main() {
  group('DemoLazyLoadBloc', () {
    late Duration throttle;
    late DemoLazyLoadRepository repository;
    late DemoLazyLoadBloc bloc;

    setUp(() async {
      throttle = throttleDuration + const Duration(milliseconds: 100);
      repository = MockDemoLazyLoadRepository();
      when(
        () => repository.getDummyList(dummyPage: any(named: 'dummyPage')),
      ).thenAnswer((_) async => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      when(
        () => repository.getDummyList(dummyPage: 5),
      ).thenAnswer((_) async => []);
      bloc = DemoLazyLoadBloc(repository: repository);
    });

    test('initial state is correct', () {
      final bloc = DemoLazyLoadBloc(repository: repository);
      expect(bloc.state, const DemoLazyLoadState());
    });

    group('DemoLazyLoadFetched', () {
      blocTest<DemoLazyLoadBloc, DemoLazyLoadState>(
        'success get first list',
        build: () => bloc,
        act: (cubit) => bloc.add(DemoLazyLoadFetched()),
        expect: () => <dynamic>[
          isA<DemoLazyLoadState>()
              .having((p0) => p0.status, 'status', DemoLazyLoadStatus.success)
              .having((p0) => p0.dummyList.length, 'dummyList.length', 10)
        ],
      );

      blocTest<DemoLazyLoadBloc, DemoLazyLoadState>(
          'failure get second list then retry',
          build: () => bloc,
          act: (cubit) async {
            bloc.add(DemoLazyLoadFetched());
            await Future.delayed(throttle);

            when(
              () => repository.getDummyList(dummyPage: any(named: 'dummyPage')),
            ).thenThrow((_) async => Exception());
            bloc.add(DemoLazyLoadFetched());
            await Future.delayed(throttle);

            when(
              () => repository.getDummyList(dummyPage: any(named: 'dummyPage')),
            ).thenAnswer((_) async => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
            bloc.add(DemoLazyLoadFetched());
          },
          expect: () => <dynamic>[
                isA<DemoLazyLoadState>()
                    .having(
                        (p0) => p0.status, 'status', DemoLazyLoadStatus.success)
                    .having(
                        (p0) => p0.dummyList.length, 'dummyList.length', 10),
                isA<DemoLazyLoadState>()
                    .having(
                        (p0) => p0.status, 'status', DemoLazyLoadStatus.failure)
                    .having(
                        (p0) => p0.dummyList.length, 'dummyList.length', 10),
                isA<DemoLazyLoadState>()
                    .having(
                        (p0) => p0.status, 'status', DemoLazyLoadStatus.success)
                    .having(
                        (p0) => p0.dummyList.length, 'dummyList.length', 20),
              ],
          verify: (_) {
            verify(() =>
                    repository.getDummyList(dummyPage: any(named: 'dummyPage')))
                .called(3);
          });

      blocTest<DemoLazyLoadBloc, DemoLazyLoadState>('end of list',
          build: () => bloc,
          act: (cubit) async {
            bloc.add(DemoLazyLoadFetched());
            await Future.delayed(throttle);

            bloc.add(DemoLazyLoadFetched());
            await Future.delayed(throttle);

            bloc.add(DemoLazyLoadFetched());
            await Future.delayed(throttle);

            bloc.add(DemoLazyLoadFetched());
            await Future.delayed(throttle);

            bloc.add(DemoLazyLoadFetched());
            await Future.delayed(throttle);

            bloc.add(DemoLazyLoadFetched());
            await Future.delayed(throttle);
          },
          skip: 5,
          expect: () => <dynamic>[
                isA<DemoLazyLoadState>()
                    .having((p0) => p0.dummyList.length, 'dummyList.length', 50)
                    .having((p0) => p0.hasReachedMax, 'hasReachedMax', true),
              ],
          verify: (_) {
            verify(() =>
                    repository.getDummyList(dummyPage: any(named: 'dummyPage')))
                .called(6);
          });
    });
  });
}
