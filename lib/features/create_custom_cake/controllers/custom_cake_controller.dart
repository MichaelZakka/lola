import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lola_app/common/utils/custom_toasts.dart';
import 'package:lola_app/common/utils/utils.dart';
import 'package:lola_app/data/enums/custom_cake_layout.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/data/models/color_model.dart';
import 'package:lola_app/data/models/custom_cake_model.dart';
import 'package:lola_app/data/models/mutual_feature_model.dart';
import 'package:lola_app/data/repositories/custom_cake_repository.dart';

class CustomCakeController extends GetxController {
  final CustomCakeRepository _repo = CustomCakeRepository();

  Rx<CustomCakeLayout> layout = Rx<CustomCakeLayout>(CustomCakeLayout.shape);

  updateLayout(CustomCakeLayout selectedLayout) {
    layout.value = selectedLayout;
    update();
  }

  var mainRequestStatus = RequestStatus.begin.obs;

  List<MutualFeaturesModel> shapes = [];
  List<MutualFeaturesModel> flavors = [];
  List<ColorModel> colors = [];
  List<MutualFeaturesModel> toppings = [];

  Rx<MutualFeaturesModel?> selectedShape = Rx<MutualFeaturesModel?>(null);
  Rx<MutualFeaturesModel?> selectedFlavor = Rx<MutualFeaturesModel?>(null);
  Rx<ColorModel?> selectedColor = Rx<ColorModel?>(null);
  Rx<MutualFeaturesModel?> selectedTopping = Rx<MutualFeaturesModel?>(null);

  TextEditingController extraTextController = TextEditingController();

  Rx<String?> extraImage = Rx<String?>(null);

  RxDouble? totalPrice = 0.0.obs;

  void uploadImage() async {
    extraImage.value = await Utils.imagePicker(ImageSource.gallery);
    update();
  }

  void selectShape(MutualFeaturesModel shape) {
    selectedShape.value = shape;
    totalPrice!.value += shape.price!;
    isCreateValidated();
    update();
  }

  void selectFlavor(MutualFeaturesModel flavor) {
    selectedFlavor.value = flavor;
    totalPrice!.value += flavor.price!;
    isCreateValidated();
    update();
  }

  void selectTopping(MutualFeaturesModel topping) {
    selectedTopping.value = topping;
    totalPrice!.value += topping.price!;
    isCreateValidated();
    update();
  }

  void selectColor(ColorModel color) {
    selectedColor.value = color;
    isCreateValidated();
    update();
  }

  bool isCreateValidated() {
    return (selectedShape.value != null &&
        selectedFlavor.value != null &&
        selectedTopping.value != null &&
        selectedColor.value != null);
  }

  getShapes() async {
    mainRequestStatus(RequestStatus.loading);
    final response = await _repo.getShapes();
    if (response.success) {
      print(response.data);
      shapes = (response.data as List)
          .map((e) => MutualFeaturesModel.fromJson(e))
          .toList();
      mainRequestStatus(RequestStatus.success);
    } else {
      mainRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  getFlavors() async {
    mainRequestStatus(RequestStatus.loading);
    final response = await _repo.getFlavors();
    if (response.success) {
      print(response.data);
      flavors = (response.data as List)
          .map((e) => MutualFeaturesModel.fromJson(e))
          .toList();
      mainRequestStatus(RequestStatus.success);
    } else {
      mainRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  getColors() async {
    mainRequestStatus(RequestStatus.loading);
    final response = await _repo.getColors();
    if (response.success) {
      print(response.data);
      colors =
          (response.data as List).map((e) => ColorModel.fromJson(e)).toList();
      mainRequestStatus(RequestStatus.success);
    } else {
      mainRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  getToppings() async {
    mainRequestStatus(RequestStatus.loading);
    final response = await _repo.getToppings();
    if (response.success) {
      print(response.data);
      toppings = (response.data as List)
          .map((e) => MutualFeaturesModel.fromJson(e))
          .toList();
      mainRequestStatus(RequestStatus.success);
    } else {
      mainRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  var createCustomCakeStatus = RequestStatus.begin.obs;

  createCustomCake() async {
    createCustomCakeStatus(RequestStatus.loading);
    update();
    CustomCakeModel customCake = CustomCakeModel(
      shape: selectedShape.value,
      flavor: selectedFlavor.value,
      color: selectedColor.value,
      topping: selectedTopping.value,
      image: extraImage.value ?? extraImage.value,
      extraText: extraTextController.value.text.trim().isNotEmpty
          ? extraTextController.value.text.trim()
          : null,
    );
    final response = await _repo.createCustomCake(customCake);
    if (response.success) {
      CustomCakeModel createdCake = CustomCakeModel.fromJson(response.data);
      final addToCartResponse = await _repo.addCustomCakeToCart(createdCake);
      print(addToCartResponse.success);
      createCustomCakeStatus(RequestStatus.success);
      Get.back();
      CustomToasts.SuccessDialog('Created Cake Successfully');
      update();
    } else {
      createCustomCakeStatus(RequestStatus.onerror);
      update();
      CustomToasts.ErrorDialog('Error creating Cake');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getShapes();
    getFlavors();
    getColors();
    getToppings();

    super.onInit();
  }
}
