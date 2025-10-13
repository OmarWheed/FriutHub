import 'package:fruits_hub/core/entitys/product_entity.dart';
import 'package:fruits_hub/features/home/domin/entity/cart_item_entity.dart';

class CartEntity {
  /// cart items in the cart contain product and count
  final List<CartItemEntity> cartItems;
  CartEntity(
    this.cartItems,
  );

  void addCartItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }

  void removeCartItem(CartItemEntity cartItem) {
    cartItems.remove(cartItem);
  }

  bool isExist(ProductEntity product) {
    return cartItems.any((item) => item.product == product);
  }

  double get calTotalPrice {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.caluTotalPrice;
    }
    return total;
  }

  CartItemEntity getCartItem(ProductEntity productEntity) {
    for (var item in cartItems) {
      item.product == productEntity;
      return item;
    }
    return CartItemEntity(product: productEntity, count: 1);
  }
}
