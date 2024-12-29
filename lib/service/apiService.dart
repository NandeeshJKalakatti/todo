// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'flash_bar_service.dart';

class ApiService {
  ApiService._();
  static final instance = ApiService._();

  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static final Dio http = Dio();

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  openURL(BuildContext context, String url) async {
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(Uri.encodeFull(url));
    } else {
      FlashBarService.instance.warning(context, 'Something went wrong, please try again');
    }
  }

  Future<dynamic> get(BuildContext context, String url, {bool auth = false}) async {
    if (await hasNetwork()) {
      try {
        debugPrint(url);
        Response response = await http.get(url);
        if (response.statusCode == 200) {
          // Check if response.data is a map or list
          if (response.data is List) {
            return response.data; // Return the list directly
          } else if (response.data is Map) {
            if (response.data['out'] == true) {
              if (response.data['body'] != null) return response.data['body'];
              return response.data;
            } else {
              FlashBarService.instance.error(context, response.data['msg']);
            }
          }
        }
      } on DioError catch (e) {
        if (e.response != null) {
          if (e.response!.statusCode != 200) {
            FlashBarService.instance.error(context, 'Something went wrong');
          }
        } else {
          FlashBarService.instance.error(context, 'Error sending request');
          debugPrint(e.message);
        }
      }
    } else {
      FlashBarService.instance.warning(context, 'Please check your internet connection');
    }
  }

  Future<dynamic> post(BuildContext context, String url, dynamic payload, {bool file = false}) async {
    if (await hasNetwork()) {
      try {
        Options? options;
        options = Options(
          contentType: file ? 'multipart/form-data' : null,
        );

        debugPrint(url);
        Response response = await http.post(url, data: file ? payload : jsonEncode(payload), options: options);
        if (response.statusCode == 200) {
          if (response.data['out'] == true) {
            if (response.data['body'] != null) return response.data['body'];
            return response.data;
          } else {
            FlashBarService.instance.error(context, response.data['msg']);
          }
        }
      } on DioError catch (e) {
        if (e.response != null) {
          if (e.response!.statusCode != 200) {
            FlashBarService.instance.error(context, 'Something went wrong');
          }
        } else {
          FlashBarService.instance.error(context, 'Error sending request');
          debugPrint(e.message);
        }
      }
    } else {
      FlashBarService.instance.warning(context, 'Please check your internet connection');
    }
  }
}
