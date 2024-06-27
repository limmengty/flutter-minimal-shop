import 'dart:convert';

ProductModel productModelFromMap(String str) =>
    ProductModel.fromMap(json.decode(str));

String productModelToMap(ProductModel data) => json.encode(data.toMap());

class ProductModel {
  final String status;
  final String requestId;
  final Data data;

  ProductModel({
    required this.status,
    required this.requestId,
    required this.data,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        requestId: json["request_id"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "request_id": requestId,
        "data": data.toMap(),
      };
}

class Data {
  final int totalProducts;
  final String country;
  final String domain;
  final List<Product> products;

  Data({
    required this.totalProducts,
    required this.country,
    required this.domain,
    required this.products,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        totalProducts: json["total_products"],
        country: json["country"],
        domain: json["domain"],
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total_products": totalProducts,
        "country": country,
        "domain": domain,
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
      };
}

class Product {
  final String asin;
  final String productTitle;
  final String productPrice;
  final String? productOriginalPrice;
  final String currency;
  final String productStarRating;
  final int productNumRatings;
  final String productUrl;
  final String productPhoto;
  final int productNumOffers;
  final String productMinimumOfferPrice;
  final bool isBestSeller;
  final bool isAmazonChoice;
  final bool isPrime;
  final bool climatePledgeFriendly;
  final String salesVolume;
  final String delivery;

  Product({
    required this.asin,
    required this.productTitle,
    required this.productPrice,
    required this.productOriginalPrice,
    required this.currency,
    required this.productStarRating,
    required this.productNumRatings,
    required this.productUrl,
    required this.productPhoto,
    required this.productNumOffers,
    required this.productMinimumOfferPrice,
    required this.isBestSeller,
    required this.isAmazonChoice,
    required this.isPrime,
    required this.climatePledgeFriendly,
    required this.salesVolume,
    required this.delivery,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        asin: json["asin"],
        productTitle: json["product_title"],
        productPrice: json["product_price"],
        productOriginalPrice: json["product_original_price"],
        currency: json["currency"],
        productStarRating: json["product_star_rating"],
        productNumRatings: json["product_num_ratings"],
        productUrl: json["product_url"],
        productPhoto: json["product_photo"],
        productNumOffers: json["product_num_offers"],
        productMinimumOfferPrice: json["product_minimum_offer_price"],
        isBestSeller: json["is_best_seller"],
        isAmazonChoice: json["is_amazon_choice"],
        isPrime: json["is_prime"],
        climatePledgeFriendly: json["climate_pledge_friendly"],
        salesVolume: json["sales_volume"],
        delivery: json["delivery"],
      );

  Map<String, dynamic> toMap() => {
        "asin": asin,
        "product_title": productTitle,
        "product_price": productPrice,
        "product_original_price": productOriginalPrice,
        "currency": currency,
        "product_star_rating": productStarRating,
        "product_num_ratings": productNumRatings,
        "product_url": productUrl,
        "product_photo": productPhoto,
        "product_num_offers": productNumOffers,
        "product_minimum_offer_price": productMinimumOfferPrice,
        "is_best_seller": isBestSeller,
        "is_amazon_choice": isAmazonChoice,
        "is_prime": isPrime,
        "climate_pledge_friendly": climatePledgeFriendly,
        "sales_volume": salesVolume,
        "delivery": delivery,
      };
}
