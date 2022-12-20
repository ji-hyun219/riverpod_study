class ShoppingItemModel {
  final String name;
  final int quantity;
  final bool hasBought;
  final bool isSpicy;

  const ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });

  // shoppingItemModel 을 반환해주는 copywith 메서드 생성
  // copywith 에서 인자를 옵셔널로 받기
  ShoppingItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}
// name: name ?? this.name
// name 이 null 로 오면 현재 name 으로 선언하고
// null 이 아니면 그 인자로 할당해준다