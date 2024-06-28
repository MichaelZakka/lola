import 'package:get/get.dart';
import 'package:lola_app/data/enums/main_layout_state.dart';

class NavBarController extends GetxController {
  Rx<MainLayouState> mainState = MainLayouState.home.obs;
  setMainState(MainLayouState state) => mainState.value = state;

  @override
  void onInit() {
    super.onInit();
  }
}
