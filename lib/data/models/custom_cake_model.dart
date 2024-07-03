import 'package:lola_app/data/models/color_model.dart';
import 'package:lola_app/data/models/mutual_feature_model.dart';
import 'package:dio/dio.dart' as dio;

class CustomCakeModel {
  int? id;
  MutualFeaturesModel? shape;
  MutualFeaturesModel? flavor;
  ColorModel? color;
  MutualFeaturesModel? topping;
  String? extraText;
  double? price;
  String? image;
  int? quantity;

  CustomCakeModel(
      {this.id,
      this.shape,
      this.flavor,
      this.color,
      this.topping,
      this.extraText,
      this.price,
      this.image,
      this.quantity});

  CustomCakeModel.fromJson(Map<String?, dynamic> map) {
    id = map['data']['id'];
    shape = MutualFeaturesModel.fromJson(map['data']['shape']);
    flavor = MutualFeaturesModel.fromJson(map['data']['flavor']);
    color = ColorModel.fromJson(map['data']['color']);
    topping = MutualFeaturesModel.fromJson(map['data']['topping']);
    extraText = map['data']['text'];
    price = double.parse(map['data']['price']);
  }

  CustomCakeModel.cartFromJson(Map<String?, dynamic> map) {
    id = map['custom_cake']['id'];
    shape = MutualFeaturesModel.fromJson(map['custom_cake']['shape']);
    flavor = MutualFeaturesModel.fromJson(map['custom_cake']['flavor']);
    color = ColorModel.fromJson(map['custom_cake']['color']);
    topping = MutualFeaturesModel.fromJson(map['custom_cake']['topping']);
    extraText = map['custom_cake']['text'];
    price = double.parse(map['custom_cake']['price']);
    image = map['custom_cake']['image'];
    quantity = map['quantity'];
  }

  CustomCakeModel.historyFromJson(Map<String?, dynamic> map) {
    id = map['id'];
    shape = MutualFeaturesModel.fromJson(map['shape']);
    flavor = MutualFeaturesModel.fromJson(map['flavor']);
    color = ColorModel.fromJson(map['color']);
    topping = MutualFeaturesModel.fromJson(map['topping']);
    extraText = map['text'];
    price = double.parse(map['price']);
    // quantity = map['quantity'];
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      'flavor_id': flavor!.id,
      'color_id': color!.id,
      'shape_id': shape!.id,
      'topping_id': topping!.id,
      if(image != null) 'image': await dio.MultipartFile.fromFile(image!),
      if(extraText != null) 'text': extraText,
    };
  }

  Map<String, dynamic> customCakeToCartJson() {
    return {
      'custom_cake_id': id,
      'quantity': 1,
    };
  }

  increaseQuantity() {
    quantity = (quantity! + 1);
  }

  decreaseQuantity() {
    quantity = (quantity! - 1);
  }
}
