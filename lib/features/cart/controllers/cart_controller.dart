import 'package:get/get.dart';
import 'package:lola_app/common/utils/custom_toasts.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/data/models/cake_model.dart';
import 'package:lola_app/data/models/cart_model.dart';
import 'package:lola_app/data/models/custom_cake_model.dart';
import 'package:lola_app/data/repositories/cart_repository.dart';
import 'package:lola_app/data/repositories/order_repository.dart';
import 'package:lola_app/features/home/controllers/home_controller.dart';

class CartController extends GetxController {
  final CartRepository _repo = CartRepository();
  final OrderRepository _order_repo = OrderRepository();

  CartModel? cartItems;

  List<CakeModel> cartCakes = [];
  List<CustomCakeModel> cartCustomCakes = [];

  RxDouble totalPrice = 0.0.obs;

  var cartRequestStatus = RequestStatus.begin.obs;

  Future<void> getCart() async {
    cartRequestStatus(RequestStatus.loading);
    final response = await _repo.getCart();
    if (response.success) {
      cartItems = CartModel.fromJson(response.data);
      if (cartItems!.cakes!.isEmpty && cartItems!.customCakes!.isEmpty) {
        cartRequestStatus(RequestStatus.nodata);
      } else {
        if (cartItems!.cakes!.isNotEmpty) {
          cartCakes = cartItems!.cakes!;
        }
        if (cartItems!.customCakes!.isNotEmpty) {
          cartCustomCakes = cartItems!.customCakes!;
        }
        cartRequestStatus(RequestStatus.success);
      }
    } else {
      cartRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog('Error getting cart');
    }
  }

  calculateTotalPrice() {
    totalPrice.value = 0;
    for (int i = 0; i < cartCakes.length; i++) {
      totalPrice.value +=
          (cartCakes[i].quantity! * double.parse(cartCakes[i].price!));
    }
    for (int j = 0; j < cartCustomCakes.length; j++) {
      totalPrice.value +=
          (cartCustomCakes[j].quantity! * cartCustomCakes[j].price!);
    }
    update();
  }

  increaseCakeQuantity(CakeModel cake) {
    cake.increaseQuantity();
    calculateTotalPrice();
    update();
  }

  decreaseCakeQuantity(CakeModel cake) async {
    if (cake.quantity == 1) {
      cartCakes.removeWhere((element) => element.id == cake.id);
      calculateTotalPrice();
      update();
      final response = await _repo.removeCakeFromCart(cake.id.toString());
      if (response.success) {
        cartCakes.removeWhere((element) => element.id == cake.id);
        calculateTotalPrice();
        update();
      } else {
        cartCakes.add(cake);
        calculateTotalPrice();
        update();
      }
    } else {
      cake.decreaseQuantity();
      calculateTotalPrice();
      update();
    }
  }

  increaseCustomCakeQuantity(CustomCakeModel cake) {
    cake.increaseQuantity();
    calculateTotalPrice();
    update();
  }

  decreaseCustomCakeQuantity(CustomCakeModel cake) async {
    if (cake.quantity == 1) {
      cartCustomCakes.removeWhere((element) => element.id == cake.id);
      calculateTotalPrice();
      update();
      final response = await _repo.removeCakeFromCart(cake.id.toString());
      if (response.success) {
        cartCustomCakes.removeWhere((element) => element.id == cake.id);
        calculateTotalPrice();
        update();
      } else {
        cartCustomCakes.add(cake);
        calculateTotalPrice();
        update();
      }
    } else {
      cake.decreaseQuantity();
      calculateTotalPrice();
      update();
    }
  }

  var checkoutRequestStatus = RequestStatus.begin.obs;

  checkOut() async {
    checkoutRequestStatus(RequestStatus.loading);
    final response = await _order_repo.createOrder();
    if (response.success) {
      cartCakes.clear();
      cartCustomCakes.clear();
      totalPrice.value = 0.0;
      cartRequestStatus(RequestStatus.nodata);
      Get.find<HomeController>().getCategories();
      update();
      checkoutRequestStatus(RequestStatus.success);
      CustomToasts.SuccessDialog('Order added successfully');
    } else {
      checkoutRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getCart().then((value) {
      calculateTotalPrice();
    });
    super.onInit();
  }
}
