import 'package:flutter/material.dart';
import '../models/api_model.dart';
import 'apiService.dart';
import 'flash_bar_service.dart';

class AdminService {
  AdminService._();
  static final instance = AdminService._();

  // Fetch list of posts (no specific userId)
  Future<List<todolist>> getlist(BuildContext context) async {
    final url = '${ApiService.baseUrl}/posts';
    final res = await ApiService.instance.get(context, url);
    if (res != null && res is List) {
      // Map the list of JSON objects to a list of todolist instances
      return res.map((json) => todolist.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // Fetch posts for a particular userId
  // In AdminService class
  Future<List<todolist>> gettodolist(BuildContext context, String id) async {
    final url = '${ApiService.baseUrl}/posts?userId=$id'; // API URL with selected ID
    final res = await ApiService.instance.get(context, url);

    if (res != null && res is List) {
      // If the response is a List, map it to the `todolist` objects
      return res.map((json) => todolist.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<bool> postexpence(
    BuildContext context,
    String? id,
    String disc,
  ) async {
    final url = '${ApiService.baseUrl}/posts';
    final payload = {
      "title": 'dfhbsdjhbf',
      "body": 'dfhbjsdbh',
      "userId": 1,
    };

    final response = await ApiService.instance.post(context, url, payload);

    if (response != null) {
      SuccessMessage data = SuccessMessage.fromJson(response);
      FlashBarService.instance.success(context, data.message);
      return true;
    }
    return false;
  }
}
