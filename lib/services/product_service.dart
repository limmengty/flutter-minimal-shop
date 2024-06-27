import 'package:ass_minimal_shop/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  // static const base_url = "https://real-time-amazon-data.p.rapidapi.com";
  static const base_url =
      "https://raw.githubusercontent.com/limmengty/fake-api/main/products";

  static Future<ProductModel?> readAPIwithError({
    required void Function(String?) onError,
  }) async {
    String url = "$base_url/allproduct.json";

    try {
      http.Response res = await http.get(Uri.parse(url));
      onError(null);
      print(res.body);
      return compute(productModelFromMap, res.body);
    } catch (e) {
      onError(e.toString());
    }
    return null;
  }

  static Future<ProductModel> getAPI() async {
    // String url =
    //     "$base_url/search?query=Phone&page=1&country=US&sort_by=RELEVANCE&product_condition=ALL";
    String url = "$base_url/computer.json";
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
          // 'X-RapidAPI-Key': 'ac01c191dfmsh9e32f95f0602a01p10e8cejsna3102c0ac2b9'
        },
      );
      return compute(productModelFromMap, response.body);
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }

  static Future<ProductModel?> getComputerProduct({
    required void Function(String?) onError,
  }) async {
    String url = "$base_url/computer.json";

    try {
      http.Response res = await http.get(Uri.parse(url));
      onError(null);
      return compute(productModelFromMap, res.body);
    } catch (e) {
      onError(e.toString());
    }
    return null;
  }

  static Future<ProductModel?> getPhoneProduct({
    required void Function(String?) onError,
  }) async {
    String url = "$base_url/iphone.json";

    try {
      http.Response res = await http.get(Uri.parse(url));
      onError(null);
      return compute(productModelFromMap, res.body);
    } catch (e) {
      onError(e.toString());
    }
    return null;
  }

  static Future<ProductModel?> getMouseProduct({
    required void Function(String?) onError,
  }) async {
    String url = "$base_url/mouse.json";

    try {
      http.Response res = await http.get(Uri.parse(url));
      onError(null);
      return compute(productModelFromMap, res.body);
    } catch (e) {
      onError(e.toString());
    }
    return null;
  }

  static Future<ProductModel?> getHeadsetProduct({
    required void Function(String?) onError,
  }) async {
    String url = "$base_url/headset.json";

    try {
      http.Response res = await http.get(Uri.parse(url));
      onError(null);
      return compute(productModelFromMap, res.body);
    } catch (e) {
      onError(e.toString());
    }
    return null;
  }

  static Future<ProductModel?> getKeyboardProduct({
    required void Function(String?) onError,
  }) async {
    String url = "$base_url/keyboard.json";

    try {
      http.Response res = await http.get(Uri.parse(url));
      onError(null);
      return compute(productModelFromMap, res.body);
    } catch (e) {
      onError(e.toString());
    }
    return null;
  }

  static Future<ProductModel?> getBagProduct({
    required void Function(String?) onError,
  }) async {
    String url = "$base_url/bag.json";

    try {
      http.Response res = await http.get(Uri.parse(url));
      onError(null);
      return compute(productModelFromMap, res.body);
    } catch (e) {
      onError(e.toString());
    }
    return null;
  }

  // static Future<ProductModel?> getIphoneProduct({
  //   required void Function(String?) onError,
  // }) async {
  //   String url = "$base_url/bag.json";

  //   try {
  //     http.Response res = await http.get(Uri.parse(url));
  //     onError(null);
  //     return compute(productModelFromMap, res.body);
  //   } catch (e) {
  //     onError(e.toString());
  //   }
  //   return null;
  // }

  // static Future<ProductModel> getIphoneProduct() async {
  //   // String url =
  //   //     "$base_url/search?query=Phone&page=1&country=US&sort_by=RELEVANCE&product_condition=ALL";
  //   String url = "$base_url/iphone.json";
  //   try {
  //     http.Response response = await http.get(
  //       Uri.parse(url),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8'
  //         // 'X-RapidAPI-Key': 'ac01c191dfmsh9e32f95f0602a01p10e8cejsna3102c0ac2b9'
  //       },
  //     );
  //     // print(response.body);
  //     await Future.delayed(const Duration(seconds: 1));
  //     return compute(productModelFromMap, response.body);
  //   } catch (e) {
  //     throw Exception("Error: ${e.toString()}");
  //   }
  // }
}
