import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final _url = "https://64ed65c6f9b2b70f2bfb78b9.mockapi.io/event/event";

  Future<Response?> getEventsData() async {
    try {
      final Response response = await _dio.get(_url);
      return response;
    } on SocketException {
      // throw const Failure(message: 'No Internet Connection');
    } catch (err) {
      print("Error :$err");
    }
  }
}
