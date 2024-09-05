class CartSingleton {
  static final CartSingleton _instance = CartSingleton._internal();

  factory CartSingleton() {
    return _instance;
  }

  CartSingleton._internal();

  final List<Map<String, String>> _cartItems = [];

  List<Map<String, String>> get cartItems => _cartItems;

  void addItem(Map<String, String> item) {
    _cartItems.add(item);
  }

  void removeItem(Map<String, String> item) {
    _cartItems.remove(item);
  }

  bool isItemInCart(Map<String, String> item) {
    return _cartItems.contains(item);
  }
}
