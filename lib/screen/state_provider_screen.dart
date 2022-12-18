import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/layout/default_layout.dart';

import '../riverpod/state_provider_screen.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provier = ref.watch(numProvider);

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provier.toString(),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(numProvider.notifier).update((state) => state + 1);
                },
                child: const Text('UPDATE'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const _NextScreen(),
                    ));
                  },
                  child: const Text('NEXT SCREEN'))
            ],
          ),
        ));
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provier = ref.watch(numProvider);

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provier.toString(),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(numProvider.notifier).update((state) => state + 1);
                },
                child: const Text('UPDATE'),
              ),
              // 2번째 방법
              // .state 를 사용해서 직접 상태값을 변경해준다
              ElevatedButton(
                onPressed: () {
                  ref.read(numProvider.notifier).state = ref.read(numProvider.notifier).state - 1;
                },
                child: const Text('DOWN'),
              ),
            ],
          ),
        ));
  }
}
