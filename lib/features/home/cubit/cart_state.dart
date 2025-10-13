enum CartStatus {
  initial,
  added,
  removed,
  error,
  updated,
}

extension CartStatusExtension on CartState {
  bool get isInitial => state == CartStatus.initial;
  bool get isAdded => state == CartStatus.added;
  bool get isRemoved => state == CartStatus.removed;
  bool get isError => state == CartStatus.error;
  bool get isUpdate => state == CartStatus.updated;
}

class CartState {
  final double total;
  final CartStatus state;
  final String? errorMessage;

  const CartState({
    this.total = 0.0,
    this.state = CartStatus.initial,
    this.errorMessage,
  });
  CartState copyWith({
    double? total,
    CartStatus? state,
    String? errorMessage,
  }) {
    return CartState(
      total: total ?? this.total,
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
