import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../layout/default_layout.dart';
import '../riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    final name = ref.watch(selectProvider.select((value) => value.name));
    // final state = ref.watch(selectProvider.select((value) => value.isSpicy)
    // 특정 값이 바뀔때만 watch 하라
    // 여기서 value 는 selectProvider 의 상태값이다 = ShoppingItemModel
    // listen 또한 select 할 수 있음.
    // ref.listen 에서도 select 를 쓰면 해당 값만 변경될 때 실행한다
    ref.listen<bool>(selectProvider.select((value) => value.isSpicy), (previous, next) {
      print('previous: $previous / next: $next');
    });

    return DefaultLayout(
      title: 'SelectProvider',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'name: $name',
            textAlign: TextAlign.center,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleItemName();
                  },
                  child: const Text('ToggleName'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleIsSpicy();
                  },
                  child: const Text('ToggleSpicy'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
