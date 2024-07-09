
import 'dart:convert';

import 'package:car_dealer_app/networking/url_manager.dart';
import 'package:dio/dio.dart';

class AuthService {
  Dio dio = new Dio();

  Future<Response> login(String username, String password) async {
    try {
      Response response = await dio.post(
        NetworkManager.apiUrl + '/oauth/token',
        data: jsonEncode(<String, String>{
          'grant_type': 'password',
          'client_id': NetworkManager.client_id,
          'client_secret': NetworkManager.client_secret,
          'username': username,
          'password': password,
        }),
      );
      return response;
    } on DioError catch (e) {
      Map<String, dynamic> resp = e.response.data;
      throw resp['msg']['msg'];
    }
  }
}