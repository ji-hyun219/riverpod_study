import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../layout/default_layout.dart';
import '../model/shopping_item_model.dart';
import '../riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ShoppingItemModel> state = ref.watch(shoppingListNotifierProvier);

    return DefaultLayout(
      title: 'StateNotifierProvider',
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
