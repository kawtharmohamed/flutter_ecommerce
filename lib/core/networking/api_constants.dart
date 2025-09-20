class ApiConstants {
  static const String baseUrl = 'https://fakestoreapi.com';
  static const String products = '$baseUrl/products';
  static const String categories = '$baseUrl/products/categories';
}

class ApiErrors{
  static const unknownError="Unknown Error";
  static const noInternetError="No Internet Error";
  static const timeoutError="Timeout Error";
  static const loadingMessage = "loading_message";
}