import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social/model/ServerMe.dart';
import 'package:social/model/ServerResponse.dart';
import 'package:social/model/ServerUser.dart';

Future<ServerUser> login(String email, String password) async {
  try {
    var map = new Map<String, String>();
    map['email'] = email;
    map['password'] = password;
    final response = await http.post(
        Uri.parse('http://192.168.100.236:5000/api/v1/auth/login'),
        body: <String, String>{"email": email, "password": password});
    if (response.statusCode == 200 || response.statusCode == 401) {
      return (ServerUser.fromJson(jsonDecode(response.body)));
    } else {
      throw Exception();
    }
  } catch (err) {
    throw Exception('Failed to load data');
  }
}

Future<ServerMe> getMe(String token) async {
  try {
    final response = await http.get(
        Uri.parse('http://192.168.100.236:5000/api/v1/auth/me'),
        headers: <String, String>{"Authorization": "bearer $token"});
    if (response.statusCode == 200 || response.statusCode == 401) {
      return (ServerMe.fromJson(jsonDecode(response.body)));
    } else {
      throw Exception();
    }
  } catch (err) {
    throw Exception('Failed to load data');
  }
}

Future<ServerResponse> logout(String token) async {
  try {
    final response = await http.post(
        Uri.parse('http://192.168.100.236:5000/api/v1/auth/logout'),
        headers: <String, String>{"Authorization": "bearer $token"});
    if (response.statusCode == 200 || response.statusCode == 401) {
      return (ServerResponse.fromJson(jsonDecode(response.body)));
    } else {
      throw Exception();
    }
  } catch (err) {
    throw Exception('Failed to load data');
  }
}

Future<ServerUser> refresh(String token) async {
  try {
    final response = await http.post(
        Uri.parse('http://192.168.100.236:5000/api/v1/auth/refresh'),
        headers: <String, String>{"Authorization": "bearer $token"});
    if (response.statusCode == 200 || response.statusCode == 401) {
      return (ServerUser.fromJson(jsonDecode(response.body)));
    } else {
      throw Exception();
    }
  } catch (err) {
    throw Exception('Failed to load data');
  }
}
