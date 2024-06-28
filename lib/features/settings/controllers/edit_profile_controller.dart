import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lola_app/common/utils/custom_toasts.dart';
import 'package:lola_app/common/utils/utils.dart';
import 'package:lola_app/data/enums/request_status.dart';
import 'package:lola_app/data/models/user_model.dart';
import 'package:lola_app/data/repositories/settings_repo.dart';
import 'package:lola_app/features/settings/controllers/settings_controller.dart';

class EditProfileController extends GetxController {
  final SettingsRepository _repo = SettingsRepository();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Rx<String>? pickedImage = ''.obs;

  UserModel? user;

  setValues() {
    nameController.text = user!.name!;
    emailController.text = user!.email!;
    phoneController.text = user!.phone!;
  }

  var saveUpdateReq = RequestStatus.begin.obs;
  saveUpdateInfo() async {
    saveUpdateReq(RequestStatus.loading);
    UserModel updatedUser = UserModel(
        name: nameController.value.text,
        email: emailController.value.text,
        phone: phoneController.value.text,
        image: pickedImage!.value != '' ? pickedImage!.value : null);
    final response = await _repo.updateUserInfo(updatedUser);
    print('******************UPDATE USER *********************');
    print(response.data);
    print('******************UPDATE USER *********************');
    if (response.success) {
      UserModel updatedUser = UserModel.fromJson(response.data);
      Get.find<SettingsController>().updateUserInfo(updatedUser.name!,
          updatedUser.email!, updatedUser.phone!, updatedUser.image);
      pickedImage!.value = '';
      saveUpdateReq(RequestStatus.success);
      Get.back();
      CustomToasts.SuccessDialog('Information updated Successfully');
    } else {
      saveUpdateReq(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }

  Future<void> pickImage() async {
    String? chosenImage = await Utils.imagePicker(ImageSource.gallery);
    if (chosenImage != null) {
      pickedImage!.value = chosenImage;
      update();
    } else {
      return;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    user = Get.arguments;
    setValues();
    super.onInit();
  }
}
