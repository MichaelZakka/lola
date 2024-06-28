import 'package:lola_app/data/models/cake_model.dart';

class CategoryModel {
  int? id;
  String? title;
  String? image;
  List<CakeModel>? cakes;

  CategoryModel({this.id, this.title, this.image, this.cakes});

  CategoryModel.fromJson(Map<String?, dynamic> map) {
    id = map['id'];
    title = map['title'];
    image = map['image'];
    cakes = (map['cakes'] as List).map((e) => CakeModel.fromJson(e)).toList();
  }
}
