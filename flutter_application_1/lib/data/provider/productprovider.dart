import '../model/productmodel.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ReadData {
  Future<List<Product>> loadData() async {
    var data = await rootBundle.loadString("assets/files/productlist.json");
    var dataJson = jsonDecode(data);
    return (dataJson["data"] as List).map((e) => Product.fromJson(e)).toList();
  }

  Future<Iterable<Product>> loadDataByCatId(int catId) async {
    var data = await rootBundle.loadString("assets/files/productlist.json");
    var dataJson = jsonDecode(data);
    return (dataJson["data"] as List)
      .map((e) => Product.fromJson(e))
      .where((e) => e.catId == catId) // get data with catId
      .toList();
  }
}
