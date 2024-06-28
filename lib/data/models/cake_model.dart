class CakeModel {
  int? id;
  String? image;
  String? name;
  String? flavor;
  int? numOfPeople;
  bool? isInCart;
  int? quantity;
  String? price;

  CakeModel(
      {this.id,
      this.name,
      this.image,
      this.flavor,
      this.numOfPeople,
      this.isInCart,
      this.quantity,
      this.price});

  CakeModel.fromJson(Map<String?, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map['image'];
    flavor = map['flavor'];
    numOfPeople = map['number_of_people'];
    isInCart = map['is_in_cart'];
    price = map['price'];
  }

  CakeModel.cartFromJson(Map<String?, dynamic> map) {
    id = map['cake']['id'];
    name = map['cake']['name'];
    image = map['cake']['image'];
    flavor = map['cake']['flavor'];
    numOfPeople = map['cake']['number_of_people'];
    isInCart = map['cake']['is_in_cart'];
    price = map['cake']['price'];
    quantity = map['quantity'];
  }

  CakeModel.historyFromJson(Map<String?, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map['image'];
    flavor = map['flavor'];
    numOfPeople = map['number_of_people'];
    isInCart = map['is_in_cart'];
    price = map['price'];
    // quantity = map['quantity'];
  }

  changeIsInCartStatus(bool status) {
    isInCart = status;
  }

  increaseQuantity() {
    quantity = (quantity! + 1);
  }

  decreaseQuantity(){
    quantity = (quantity! - 1);
  }


}
