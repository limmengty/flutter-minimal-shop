import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/models/product_model.dart';
import 'package:ass_minimal_shop/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheLogic extends ChangeNotifier {
  ProductModel? _productModel;
  ProductModel? get productModel => _productModel;

  ProductModel? _phoneModel;
  ProductModel? get phoneModel => _phoneModel;

  ProductModel? _mouseModel;
  ProductModel? get mouseModel => _mouseModel;

  ProductModel? _keyboardModel;
  ProductModel? get keyboardModel => _keyboardModel;

  ProductModel? _computerModel;
  ProductModel? get computerModel => _computerModel;

  ProductModel? _headsetModel;
  ProductModel? get headsetModel => _headsetModel;

  ProductModel? _bagModel;
  ProductModel? get bagModel => _bagModel;

  bool _loading = false;
  bool get loading => _loading;

  // dart mode
  int _modeIndex = 1;
  int get modeIndex => _modeIndex;
  final FlutterSecureStorage _secure = const FlutterSecureStorage();
  final _key = "CacheFlutterSecureStorage";
  // change language
  int _lang = 0;
  int get lang => _lang;
  final _langKey = "CacheFlutterSecureStorage";

  CacheMinimalAppLanguage _cacheLang = cacheMinimalAppLanguageList[0];
  CacheMinimalAppLanguage get cacheLang => _cacheLang;

  Future initCache() async {
    // dark mode
    String index = await _secure.read(key: _key) ?? "1";
    _modeIndex = int.parse(index);

    // chnage  language
    String langStr = await _secure.read(key: _langKey) ?? "0";
    _modeIndex = int.parse(langStr);
    _cacheLang = cacheMinimalAppLanguageList[_lang];
  }

  void changeToLight() async {
    _modeIndex = 1;
    _secure.write(key: _key, value: _modeIndex.toString());
    notifyListeners();
  }

  void changeToDark() async {
    _modeIndex = 2;
    _secure.write(key: _key, value: _modeIndex.toString());
    notifyListeners();
  }

  void changeToSystem() async {
    _modeIndex = 3;
    _secure.write(key: _key, value: _modeIndex.toString());
    notifyListeners();
  }

  void changeToEN() async {
    _lang = 0;
    _secure.write(key: _langKey, value: _modeIndex.toString());
    _cacheLang = cacheMinimalAppLanguageList[_lang];
    notifyListeners();
  }

  void changeToKH() async {
    _lang = 1;
    _secure.write(key: _langKey, value: _modeIndex.toString());
    _cacheLang = cacheMinimalAppLanguageList[_lang];
    notifyListeners();
  }

  // user cart
  final List<Product> _cart = [];
  // get user cart
  List<Product> get cart => _cart;

  // user fav
  List<Product> _fav = [];
  // get user fav
  List<Product> get fav => _fav;

  // bool _isFav = false;
  // get isFav => _isFav;
  bool isFav(Product product) {
    return _fav.contains(product);
  }

  // add item to cart"
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
  // add item to fav"

  void addToFav(Product product) {
    if (_fav.contains(product)) {
      _fav.remove(product);
    } else {
      _fav.add(product);
    }
    notifyListeners();
  }

  // // remove item from fav
  // void removeFromFav(Product product) {
  //   _fav.remove(product);
  //   _isFav = !isFav;
  //   notifyListeners();
  // }

  String? _error;
  String? get error => _error;

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  Future read() async {
    _productModel = await ProductServices.readAPIwithError(
      onError: (String? e) {
        _error = e;
      },
    );
    _phoneModel = await ProductServices.getPhoneProduct(
      onError: (String? e) {
        _error = e;
      },
    );
    _keyboardModel = await ProductServices.getKeyboardProduct(
      onError: (String? e) {
        _error = e;
      },
    );
    _computerModel = await ProductServices.getComputerProduct(
      onError: (String? e) {
        _error = e;
      },
    );
    _mouseModel = await ProductServices.getMouseProduct(
      onError: (String? e) {
        _error = e;
      },
    );
    _headsetModel = await ProductServices.getHeadsetProduct(
      onError: (String? e) {
        _error = e;
      },
    );
    _bagModel = await ProductServices.getBagProduct(
      onError: (String? e) {
        _error = e;
      },
    );
    _fav = [];
    _loading = false;
    notifyListeners();
  }
}
