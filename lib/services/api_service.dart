import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../model/cart_model.dart';

class ApiService {
  Future<Cart?> getData() async {
    const String apiUrl = "https://dummyjson.com/carts";
    try {
      Response response = await Dio().get(apiUrl);
      if (response.data != null) {
        return Cart.fromJson(response.data);
      } else {
        throw Exception("API response is null!!!");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
