import 'dart:io';
import 'package:car_dealer_app/models/auth_login_response.dart';
import 'package:car_dealer_app/networking/storage_service.dart';
import 'package:car_dealer_app/networking/url_manager.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenInterceptor extends Interceptor {
  @override
  Dio dio = new Dio();
  StorageService _storage = new StorageService();

  onRequest(RequestOptions options) async {
    dio.lock();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.get("access_token");
    dio.unlock();
    options.headers["Authorization"] = "Bearer " + accessToken;
    // options.data = {
    //   "perpage": 2,
    //   "filter": {"query": "", "status": "", "dealerIds": []}
    // };
    return options;
  }

  onError(DioError error) async {
    Dio tokenDio = DioUtil.getInstance().tokenDio;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (error.response != null && error.response.statusCode == 401) {
      //401 for token expiration
      RequestOptions options = error.response.request;
      dio.lock();
      String accessToken = prefs.get("access_token");
      String refreshToken = prefs.get("refresh_token");
      return tokenDio
          .post(
            NetworkManager.apiUrl + '/oauth/token',
            data: {"grant_type": "refresh_token", "refresh_token": refreshToken, "client_id": NetworkManager.client_id, "client_secret": NetworkManager.client_secret},
            options: new Options(headers: {HttpHeaders.authorizationHeader: 'Bearer $accessToken'}),
          )
          .then((d) {
            AuthLoginResponse auth = AuthLoginResponse.fromJson(d.data);
            _storage.setAuth(auth);
            return auth;
          })
          .whenComplete(() => dio.unlock())
          .then((AuthLoginResponse e) {
            String accessToken = e.accessToken;
            //repeat
            return dio.request(options.path, options: new Options(headers: {HttpHeaders.authorizationHeader: 'Bearer $accessToken'}));
          });
    }
    super.onError(error);
  }
}

class DioUtil {
  Dio dio;
  Dio tokenDio = new Dio();
  static DioUtil _instance;

  static DioUtil getInstance() {
    if (_instance == null) {
      _instance = DioUtil();
    }
    return _instance;
  }
}
