import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entitys/product_entity.dart';
import 'package:fruits_hub/features/home/cubit/cart_state.dart';
import 'package:fruits_hub/features/home/domin/entity/cart_entity.dart';
import 'package:fruits_hub/features/home/domin/entity/cart_item_entity.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  final CartEntity cartEntity = CartEntity([]);

  void addProduct(ProductEntity productEntity) {
    bool isExistProduct = cartEntity.isExist(productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);
    if (!isExistProduct) {
      cartEntity.addCartItem(cartItem);
    } else {
      cartItem.increaseCount();
    }
    emit(state.copyWith(state: CartStatus.added));
  }

  void removeFromCart(CartItemEntity item) {
    cartEntity.removeCartItem(item);
    emit(state.copyWith(state: CartStatus.removed));
  }

  void updateCart() {
    emit(state.copyWith(state: CartStatus.updated));
  }
  int get cartItemsLength => cartEntity.cartItems.length;
}
