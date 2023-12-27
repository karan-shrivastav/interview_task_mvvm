import 'package:flutter/material.dart';
import 'package:interview_task/models/data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataNotifierProvider = ChangeNotifierProvider((ref) => ViewModelNotifier());

class ViewModelNotifier extends ChangeNotifier {
  List<DataModel> dataList = [];
  Future<void> getData() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.thedogapi.com/v1/breeds'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        dataList = jsonData.map((json) => DataModel.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
