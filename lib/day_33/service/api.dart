import 'dart:convert';
import 'dart:developer';

import 'package:flutter_demoppkd_ariq/day_33/model/login_model.dart';
import 'package:flutter_demoppkd_ariq/day_33/model/profile_model.dart';
import 'package:flutter_demoppkd_ariq/shared_preferences/preferences_handler.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_demoppkd_ariq/day_33/constant/endpoint.dart';
import 'package:flutter_demoppkd_ariq/day_33/model/register_model.dart';

class AuthAPI {
  static Future<RegistrationModel> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return RegistrationModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error['message']);
    }
  }

  static Future<LoginModel> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {'email': email, 'password': password},
    );
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error['message']);
    }
  }

  static Future<ProfileModel> getProfile() async {
    final token = await PreferencesHandler.getToken();
    final url = Uri.parse(Endpoint.profil);

    final response = await http.get(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    print("GET PROFILE: ${response.body}");

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error['message']);
    }
  }

  static Future<ProfileModel> updateProfile({required String name}) async {
    final token = await PreferencesHandler.getToken();
    final url = Uri.parse(Endpoint.profil);

    final response = await http.put(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
      body: {"name": name},
    );

    print("UPDATE PROFILE: ${response.body}");

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }
}
