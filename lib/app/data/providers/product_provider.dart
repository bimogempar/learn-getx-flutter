import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductProvider extends GetConnect {
  String url =
      "https://learn-getx-flutter-firebase-default-rtdb.firebaseio.com/";

  Future<Product?> getProduct(int id) async {
    final response = await get('product/$id');
    return response.body;
  }

  Future<dynamic> postProduct(String name, String date) async {
    final response = await post('$url'+'products.json', {
      "name": name,
      "createdAt": date,
    });
    return response.body;
  }

  Future<void> deleteProduct(String id) async => await delete('$url'+'products/$id.json');
}
