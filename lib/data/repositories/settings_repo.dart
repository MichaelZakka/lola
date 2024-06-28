import 'package:dio/dio.dart';
import 'package:lola_app/common/constants/end_points.dart';
import 'package:lola_app/common/providers/local/cache_provider.dart';
import 'package:lola_app/common/providers/remote/api_provider.dart';
import 'package:lola_app/data/models/app_response.dart';
import 'package:lola_app/data/models/user_model.dart';

class SettingsRepository {
  Future<AppResponse> getUserInfo() async {
    // print(user.toJson());
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.userProfileUrl, token: CacheProvider.getAppToken());
      return AppResponse(
          success: true, data: appResponse.data['data'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> updateUserInfo(UserModel updatedUser) async {
    var data = await updatedUser.updateUsertoJson();
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.updateUserInfoUrl,
        body: FormData.fromMap(data),
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
          success: true, data: appResponse.data['data'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }
}
