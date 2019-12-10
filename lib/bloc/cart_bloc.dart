import 'dart:async';
import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/services/cart_service.dart';

class CartBloc implements BlocBase {
  CartProduct product;
  List<CartProduct> productList;
  CartService cartService;

  final StreamController <List<CartProduct>> _cartController = StreamController<List<CartProduct>>();
  Stream get cartList => _cartController.stream;

  CartBloc(){
    cartService = CartService();
    // _cartController.stream.listen(_getCartItems);
  }

   void addItem(CartProduct item) async {
    await cartService.addItem(item);
    _getCartItems();

  }

  _getCartItems()async {
    productList = await cartService.getCartList();
    _cartController.sink.add(productList);
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cartController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }

}