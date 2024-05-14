import 'package:dio/dio.dart';

class APIService {
  static late Dio _dio;
  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: "https://unofficial-shein.p.rapidapi.com/",
      headers: {
        'X-RapidAPI-Key': 'ddd27b9becmsh01d01b6c63333b2p1bff65jsn1dd86f3f6cbb',
        'X-RapidAPI-Host': 'unofficial-shein.p.rapidapi.com'
      },
      receiveDataWhenStatusError: false,
      receiveTimeout: const Duration(seconds: 5000),
      connectTimeout: const Duration(seconds: 6000),
    ));
    print("init");
  }

  static Map<String, dynamic> _data = {};
  static Future _get(String url, Map<String, dynamic> parameters) async {
    await _dio
        .get(
      url,
      queryParameters: parameters,
    )
        .then((value) {
      _data = value.data;
      return _data;
      // print(data); done
      //return data;
    });
  }

  static Map<String, dynamic> productData = {};
  static Future getProductById(int id) async {
    await _get("products/detail", {
      "goods_id": id,
      "language": 'ar',
      "country": 'US',
      "currency": 'USD'
    }).then((value) {
      productData = _data;

      return productData;
    });
  }

  static Map<String, dynamic> partitionProducts = {};
  static Future getPartitionProductsData(int partetionId) async {
    await _get("products/list", {"cat_id": partetionId}).then((value) {
      partitionProducts = _data;
      return partitionProducts;
    });
  }

  static Map<String, dynamic> reviews = {};
  static Future getReviewsOfProduct(
      int productId, String goodsSn, String productRelationID) async {
    await _get("/products/get-reviews", {
      "language": "en",
      "country": "US",
      "currency": "USD",
      "goods_id": productId,
      "goods_spu": productRelationID,
      "sku": goodsSn
    }).then((value) {
      reviews = _data;
      return reviews;
    });
  }
}
