import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/providers/local/cache_provider.dart';
import 'package:lola_app/common/routers/app_router.dart';
import 'package:lola_app/common/utils/custom_toasts.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/data/models/user_model.dart';
import 'package:lola_app/data/repositories/auth_repository.dart';

class RegisterController extends GetxController {
  final AuthRepository _repo = AuthRepository();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final registerFormKey = GlobalKey<FormState>();
  var registerReqState = RequestStatus.begin.obs;

  RxBool passwordObscureText = true.obs;

  Future<void> register() async {
    registerReqState(RequestStatus.loading);
    UserModel model = UserModel(
      name: nameController.value.text,
      email: emailController.value.text,
      phone: phoneController.value.text,
      password: confirmPasswordController.value.text,
    );

    final response = await _repo.register(model);
    if (response.success) {
      registerReqState(RequestStatus.success);
      print(response.data);
      UserModel user = UserModel.fromJson(response.data['data']['user']);
      CacheProvider.setAppToken(response.data['data']['token']);
      CacheProvider.setUserEmail(user.email!);
      CacheProvider.setUserID(user.id!);
      CacheProvider.setUserName(user.name!);
      CacheProvider.setUserPhone(user.phone!);
      Get.offAllNamed(AppRoute.navBarPageUrl);
    } else {
      registerReqState(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }
}
