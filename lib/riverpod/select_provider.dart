import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
  (ref) => SelectNotifier(),
);
// stateNotifierProvider 에 제너릭에서
// 첫번째는 SelectNotifier 타입을 선언하고
// 두번째는 ShoppingItemModel 타입을 선언

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          const ShoppingItemModel(
            name: '김치',
            quantity: 1,
            hasBought: false,
            isSpicy: false,
          ),
        );

  toggleItemName() {
    if (state.name == '김치') {
      state = state.copyWith(
        name: '피자',
      );
    } else {
      state = state.copyWith(
        name: '김치',
      );
    }
  }

  toggleIsSpicy() {
    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }
}
