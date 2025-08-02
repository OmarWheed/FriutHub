import 'package:fruits_hub/core/entitys/product_entity.dart';

ProductEntity getDummyProduct = ProductEntity(
  productName: 'Aplle',
  productPrice: 12,
  productCode: '123',
  productDescribtion: 'fruits',
  isFeature: false,
  reviews: [],
  expirationsMonths: 0,
  numberOfCalories: 0,
  unitAmount: 0,
  imageUrl:
      'https://images.pexels.com/photos/1640770/pexels-photo-1640770.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
);

List<ProductEntity> get getDummyProducts => [
      getDummyProduct,
      getDummyProduct,
      getDummyProduct,
      getDummyProduct,
      getDummyProduct,
      getDummyProduct,
      getDummyProduct,
      getDummyProduct,
      getDummyProduct,
      getDummyProduct,
    ];
