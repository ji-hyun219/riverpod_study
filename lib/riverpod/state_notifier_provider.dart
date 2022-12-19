// stste_notifier_provider
// class 를 사용한다
// 이때 stateNotifier 를 상속해줘야 한다

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/shopping_item_model.dart';

// 실제로 쓰려면 Provider 로 만들어줘야 한다
// Notifier 는 상태를 관리해주는 것일뿐
// StateNotifierProvider 는 StateNotifier 클래스를 Provider 로 만듦
// 제너릭 첫번째 인자는 해당 Nofifier 를, 두번째 인자는 Notifier 의 타입을 넣어준다
final shoppingListNotifierProvier = StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(), // 관리할 클래스를 인스턴스로 만들어준다
);

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // super 로 초기화 (즉, super 안에는 초기화 값이 들어감)

  ShoppingListNotifier()
      : super(
          [
            const ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            const ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            const ShoppingItemModel(
              name: '바나나',
              quantity: 2,
              hasBought: true,
              isSpicy: false,
            ),
            const ShoppingItemModel(
              name: '사과',
              quantity: 4,
              hasBought: false,
              isSpicy: false,
            ),
            const ShoppingItemModel(
              name: '딸기',
              quantity: 5,
              hasBought: true,
              isSpicy: false,
            ),
          ],
        );

  void toggleHasBought({required String name}) {
    // 참고로 state 는 StateNotifier 에서 제공해주는 현재 상태임
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
