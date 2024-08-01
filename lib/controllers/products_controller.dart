import 'dart:convert';
import 'package:http/http.dart' as http;

// List<Map<String, dynamic>> receivedProducts =[];
class ProductsController{

  Future<List<Map<String, dynamic>>>  getProductsById(String occasionTypeId) async{
    final response = await http.get(
      Uri.parse(
          'https://apistaging.cadeau.com.sa/api/v1//products?occasion_type_id=$occasionTypeId'),
    );
    List<Map<String, dynamic>> receivedProducts =[];
    print('products response : ${response.body}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final dynamicList = data['data']['products'];

      receivedProducts = convertToListOfStringMaps(dynamicList);
      print(receivedProducts.toList());
    }
  return receivedProducts;
  }

  List<Map<String, String>> convertToListOfStringMaps(dynamic data) {
    if (data is List) {
      return data.cast<Map<String, dynamic>>().map((item) {
        return item.map((key, value) {
          return MapEntry(key.toString(), value.toString());
        });
      }).toList();
    } else {
      throw ArgumentError('Data is not a list of maps');
    }
  }
  // Future<Map<String,dynamic>> getProductById(String productId)async {
  //   final response = await http.get(
  //     Uri.parse(
  //         'https://apistaging.cadeau.com.sa/api/v1/products/$productId'),
  //   );
  //   print('product id  response : ${response.body}');
  //   final Map<String, dynamic> data = jsonDecode(response.body);
  //   final productMap = data['data']['product'];
  //   print(productMap);
  //   return productMap;
  // }
}