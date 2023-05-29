class ApiConstance {
  static const String baseUrl = 'https://fakestoreapi.com/';
  static const String productsPath = '${baseUrl}products';
  static const String oneProductsPath = '${baseUrl}products/';
  static const String productsPathFilter = '${oneProductsPath}category/';
  static const String productsPathLimit = '${baseUrl}products?limit=';
  static const String productsPathSort = '${baseUrl}products?sort=';
  static const String productsPathCategories = '$productsPath/categories';
  static const String cartPath='${baseUrl}carts';
  static const String cartPathUser='${baseUrl}carts/user/';
  static const String userProfile='${baseUrl}users/';
  static const String userLogin='${baseUrl}auth/login';
}
