class MutualFeaturesModel {
  int? id;
  String? name;
  String? image;
  double? price;

  MutualFeaturesModel({
    this.id,
    this.name,
    this.image,
    this.price,
  });

  MutualFeaturesModel.fromJson(Map<String?, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map['image'];
    price = double.parse(map['price']);
  }

}