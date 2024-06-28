class ColorModel {
  int? id;
  String? hex;

  ColorModel({
    this.id,
    this.hex,
  });

  ColorModel.fromJson(Map<String?, dynamic> map){
    id = map['id'];
    hex = map['hex'];
  }
}
