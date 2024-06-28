import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lola_app/common/providers/local/cache_provider.dart';
import 'package:lola_app/common/routers/app_router.dart';
import 'package:lola_app/common/utils/custom_toasts.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/data/models/user_model.dart';
import 'package:lola_app/data/repositories/auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository _repo = AuthRepository();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();
  var loginReqState = RequestStatus.begin.obs;

  RxBool passwordObscureText = true.obs;

  Future<void> login() async {
    loginReqState(RequestStatus.loading);
    final response = await _repo.login(
      emailController.value.text.trim(),
      passwordController.value.text.trim(),
    );
    if (response.success) {
      loginReqState(RequestStatus.success);
      UserModel user = UserModel.fromJson(response.data['user']);
      CacheProvider.setAppToken(response.data['token']);
      CacheProvider.setUserEmail(user.email!);
      CacheProvider.setUserID(user.id!);
      CacheProvider.setUserName(user.name!);
      CacheProvider.setUserPhone(user.phone!);
      Get.offAllNamed(AppRoute.navBarPageUrl);
    } else {
      loginReqState(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }
}
