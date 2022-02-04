import 'package:advance_pro/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier{
  ProductModel? _productModel;
  List<Payload> _allProductList = [];

  get allProductList => _allProductList;

  Future<void> getAllProducts() async {
    _allProductList.clear();
    try{
      http.Response response = await http.get(
          Uri.parse("https://webhooktest61.advanceprotech.com/api/products"),
        headers: {
          'accept' : 'application/json',
          'Authorization' : 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxMDEiLCJyb2xlIjoiVXNlciIsIm5iZiI6MTY0Mzk2NzUyNywiZXhwIjoxNjQ0MTM1NTI3LCJpYXQiOjE2NDM5Njc1Mjd9.Zob0SQBrjRil5KOMP6bUDqu5HvZfWD--51OTy9ieOO4'
        }
      );
      _productModel = productModelFromJson(response.body);
      _allProductList = _productModel!.payload!;
      print('product response = ${_productModel!.success} and total products = ${_allProductList.length}');
      notifyListeners();
    }catch(error){
      print("Fetching all products failed, error: $error");
    }
  }
}
