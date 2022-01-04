import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx_flutter/app/data/providers/product_provider.dart';

import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var products = List<Product>.empty().obs;

  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Terjadi kesalahan",
      content: Text(msg, textAlign: TextAlign.center),
    );
  }

  void add(String name) {
    if (name != '') {
      final date = DateTime.now().toIso8601String();

      ProductProvider().postProduct(name, date).then((response) {
        final data = Product(id: date, name: name, createdAt: date);
        products.add(data);
        Get.back();
      });
    } else {
      dialogError("Semua input harus terisi");
    }
  }

  void delete(String id) {
    ProductProvider()
        .deleteProduct(id)
        .then((_) => products.removeWhere((element) => element.id == id));
  }

  findById(String id) {
    return products.firstWhere((element) => element.id == id);
  }

  void edit(String id, String name) {
    final data = findById(id);
    data.name = name;
    products.refresh();
    Get.back();
  }
}
