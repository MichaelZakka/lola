import 'package:get/get.dart';
import 'package:lola_app/common/providers/local/cache_provider.dart';
import 'package:lola_app/common/routers/app_router.dart';
import 'package:lola_app/common/utils/custom_toasts.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/data/models/user_model.dart';
import 'package:lola_app/data/repositories/auth_repository.dart';
import 'package:lola_app/data/repositories/settings_repo.dart';

class SettingsController extends GetxController {
  final AuthRepository _authRepo = AuthRepository();
  final SettingsRepository _settingsRepo = SettingsRepository();

  //USER INFO
  var userInfoReqStatus = RequestStatus.begin.obs;
  UserModel? user;

  getUserInfo() async {
    userInfoReqStatus(RequestStatus.loading);
    final response = await _settingsRepo.getUserInfo();
    if (response.success) {
      print(response.data);
      userInfoReqStatus(RequestStatus.success);
      user = UserModel.fromJson(response.data);
      print('*********************************');
      print(user!.toJson());
      print('*********************************');
    } else {
      userInfoReqStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  updateUserInfo(String name, String email, String phone, String? userImage) {
    user!.name = name;
    user!.email = email;
    user!.phone = phone;
    user!.image = userImage;

    update();
  }

  //LOGOUT
  var logoutReqStatus = RequestStatus.begin.obs;

  logout() async {
    logoutReqStatus(RequestStatus.loading);
    final response = await _authRepo.logOut();
    if (response.success) {
      print(response.data);
      await CacheProvider.clearStorage();
      Get.offAllNamed(AppRoute.loginPageUrl);
    } else {
      logoutReqStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getUserInfo();
    super.onInit();
  }
}
