import 'package:get/get.dart';
import 'package:lola_app/common/utils/custom_toasts.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/data/models/cake_model.dart';
import 'package:lola_app/data/models/category_model.dart';
import 'package:lola_app/data/models/country_model.dart';
import 'package:lola_app/data/repositories/cart_repository.dart';
import 'package:lola_app/data/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepo = HomeRepository();
  final CartRepository _cartRepo = CartRepository();

  List<CategoryModel> categories = [];

  var homeReqStatus = RequestStatus.begin.obs;

  getCategories() async {
    homeReqStatus(RequestStatus.loading);
    final response = await _homeRepo.getCategories();
    if (response.success) {
      print(response.data);
      categories = (response.data as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      homeReqStatus(RequestStatus.success);
    } else {
      homeReqStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  List<CountryModel> countries = [
    CountryModel(id: 0, image: 'assets/images/flags/syria.png', name: 'syria'),
    CountryModel(
        id: 1, image: 'assets/images/flags/ksa.png', name: 'Saudi Arabia'),
    CountryModel(
        id: 2,
        image: 'assets/images/flags/uae.png',
        name: 'United Arab Emarites'),
    CountryModel(
        id: 3, image: 'assets/images/flags/jordan.png', name: 'Jordan'),
    CountryModel(
        id: 4, image: 'assets/images/flags/lebanon.png', name: 'Lebanon'),
    CountryModel(id: 5, image: 'assets/images/flags/iraq.png', name: 'Iraq')
  ];

  Rx<CountryModel?> selectedCountry = Rx<CountryModel?>(null);

  selectCountry(CountryModel country) {
    selectedCountry.value = country;
    update();
  }

  addCakeToCart(CakeModel cake) async {
    cake.changeIsInCartStatus(true);
    update();
    final response = await _cartRepo.addCakeToCart(cake.id!);
    if (response.success) {
    } else {
      cake.changeIsInCartStatus(false);
      update();
    }
  }

  removeCakeFromCart(CakeModel cake) async {
    cake.changeIsInCartStatus(false);
    update();
    final response = await _cartRepo.removeCakeFromCart(cake.id!.toString());
    if (response.success) {
    } else {
      cake.changeIsInCartStatus(true);
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getCategories();
    selectedCountry.value = countries[0];
    super.onInit();
  }
}
