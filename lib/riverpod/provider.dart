import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/model/shopping_item_model.dart';
import 'state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>((ref) {
  final filterState = ref.watch(filterProvider);
  final shoppingListState = ref.watch(shoppingListNotifierProvier);

  if (filterState == FilterState.all) {
    return shoppingListState;
  }

  return shoppingListState
      .where(
        (element) => filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy,
      )
      .toList();
});

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
