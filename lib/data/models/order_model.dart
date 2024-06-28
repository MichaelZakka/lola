import 'package:lola_app/data/models/cake_model.dart';
import 'package:lola_app/data/models/custom_cake_model.dart';

class OrderModel {
  int? id;
  String? totalPrice;
  String? date;
  List<CakeModel>? cakes;
  List<CustomCakeModel>? customCakes;

  OrderModel({
    this.id,
    this.totalPrice,
    this.date,
    this.cakes,
    this.customCakes,
  });

  OrderModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    totalPrice = map['total_price'];
    date = map['order_date'];
    cakes =
        (map['cakes'] as List).map((e) => CakeModel.historyFromJson(e)).toList();
    customCakes = (map['custom_cakes'] as List)
        .map((e) => CustomCakeModel.historyFromJson(e))
        .toList();
  }
}
