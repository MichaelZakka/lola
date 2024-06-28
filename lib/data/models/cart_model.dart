import 'package:lola_app/data/models/cake_model.dart';
import 'package:lola_app/data/models/custom_cake_model.dart';

class CartModel {
  List<CakeModel>? cakes;
  List<CustomCakeModel>? customCakes;

  CartModel({this.cakes, this.customCakes});

  CartModel.fromJson(Map<String?, dynamic> map) {
    cakes = (map['data']['cakes'] as List)
        .map((e) => CakeModel.cartFromJson(e))
        .toList();
    customCakes = (map['data']['custom_cakes'] as List)
        .map((e) => CustomCakeModel.cartFromJson(e))
        .toList();
  }

  
}
