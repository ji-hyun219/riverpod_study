import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/layout/default_layout.dart';
import 'package:riverpod_study/riverpod/provider.dart';

import '../riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);
    // 분명히 filteredShoppingListProvider 를 watch 하고 있지만
    // 아래 shoppingListNotifierProvier 를 변경해도
    // 아래 print 문이 빌드되면서 실행된다
    // 그 이유는 Provider.dart 에서 최상위 filteredShoppingListProvider 가
    // 하위 shoppingListNotifierProvier 를 watch 하고 있기 때문이다

    // print(state);

    return DefaultLayout(
      title: 'Provider',
      actions: [
        PopupMenuButton<FilterState>(
          itemBuilder: (_) {
            return FilterState.values
                .map(
                  (e) => PopupMenuItem<FilterState>(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList();
          },
          onSelected: (value) {
            ref.read(filterProvider.notifier).update((state) => value);
          },
        ),
      ],
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                value: e.hasBought,
                title: Text('${e.name}(${e.quantity})'),
                onChanged: (value) {
                  ref.read(shoppingListNotifierProvier.notifier).toggleHasBought(
                        // .notifier 를 하면 클래스를 가져올 수 있다!!
                        name: e.name,
                      );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
