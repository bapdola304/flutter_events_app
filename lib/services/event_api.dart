import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/models/favourite.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio = Dio();
  final _url = "https://64ed65c6f9b2b70f2bfb78b9.mockapi.io/event/event";

  Future<Response?> getEventsData() async {
    try {
      final Response response = await _dio.get(_url);
      return response;
    } on SocketException {
      // throw const Failure(message: 'No Internet Connection');
      return null;
    } catch (err) {
      print("Error :$err");
      return null;
    }
  }

  Future<Response?> getFavouriteList() async {
    try {
      final Response response = await _dio.get('$_url/?isFavourite=true');
      return response;
    } on SocketException {
      // throw const Failure(message: 'No Internet Connection');
      return null;
    } catch (err) {
      print("Error :$err");
      return null;
    }
  }

  Future<Response?> getEvent(String id) async {
    try {
      debugPrint('$_url/:$id');
      final Response response = await _dio.get('$_url/$id');
      return response;
    } on SocketException {
      // throw const Failure(message: 'No Internet Connection');
      return null;
    } catch (err) {
      print("Error :$err");
      return null;
    }
  }

  Future<Response?> createEvent(EventModel data) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      HttpHeaders.acceptHeader: ContentType.json.mimeType,
    };
    try {
      final Response response = await _dio.post(_url,
          data: json.encode(data), options: Options(headers: headers));
      debugPrint("response $response");
      return response;
    } on SocketException {
      // throw const Failure(message: 'No Internet Connection');
      return null;
    } catch (err) {
      print("Error :$err");
      return null;
    }
  }

  Future<Response?> deleteEvent(String id) async {
    try {
      debugPrint('$_url/:$id');
      final Response response = await _dio.delete('$_url/$id');
      return response;
    } on SocketException {
      // throw const Failure(message: 'No Internet Connection');
      return null;
    } catch (err) {
      print("Error :$err");
      return null;
    }
  }

  Future<Response?> addFavourite(String id, FavouriteRequest data) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      HttpHeaders.acceptHeader: ContentType.json.mimeType,
    };
    try {
      final Response response = await _dio.put('$_url/$id',
          data: json.encode(data), options: Options(headers: headers));
      debugPrint("response $response");
      return response;
    } on SocketException {
      // throw const Failure(message: 'No Internet Connection');
      return null;
    } catch (err) {
      print("Error :$err");
      return null;
    }
  }
}
