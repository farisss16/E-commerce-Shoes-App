// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:finalproject/model/class_data.dart';
import 'package:http/http.dart' as http;

class Repository {
  static Future<List<Products>> getData() async {
    final response = await http.get(
        Uri.parse('https://api1.sib3.nurulfikri.com/api/barang?search=Nike'),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer 824|fd8NLv4ZIhEsqFx6feo6wbih1E4J2ZeHifmgOipQ',
          HttpHeaders.contentTypeHeader: 'application/json'
        });

    if (response.statusCode == 200) {
      List responseJson = (json.decode(response.body))['data'];
      return responseJson.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }
}

class Repository2 {
  static Future<List<Products>> getData() async {
    final response = await http.get(
        Uri.parse('https://api1.sib3.nurulfikri.com/api/barang?search=Vans'),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer 824|fd8NLv4ZIhEsqFx6feo6wbih1E4J2ZeHifmgOipQ',
          HttpHeaders.contentTypeHeader: 'application/json'
        });

    if (response.statusCode == 200) {
      List responseJson = (json.decode(response.body))['data'];
      return responseJson.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
