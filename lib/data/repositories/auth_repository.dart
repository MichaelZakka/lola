import 'package:dio/dio.dart';
import 'package:lola_app/common/providers/local/cache_provider.dart';
import 'package:lola_app/data/models/user_model.dart';

import '../../common/constants/end_points.dart';
import '../../common/providers/remote/api_provider.dart';
import '../models/app_response.dart';

class AuthRepository {
  Future<AppResponse> login(String email, String password) async {
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.loginUrl,
        body: {
          "email": email,
          "password": password,
        },
      );

      return AppResponse(
          success: true, data: appResponse.data['data'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> register(UserModel user) async {
    print(user.toJson());
    try {
      var appResponse = await ApiProvider.post(
          url: EndPoints.registerUrl, body: user.toJson());
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> logOut() async {
    try {
      var appResponse = await ApiProvider.post(
          url: EndPoints.logoutUrl, token: CacheProvider.getAppToken());

      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }
}
