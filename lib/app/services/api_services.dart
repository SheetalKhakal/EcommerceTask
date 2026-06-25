import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

class ApiService{

  Future<dynamic> get(String url) async{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    throw Exception("Failed");
  }

  Future<dynamic> post(String url, Map<String,dynamic>body)async{
    final response= await http.post(Uri.parse(url),body: jsonEncode(body), headers: {"Content-Type":"application/json"});
  if(response.statusCode >= 200 && response.statusCode < 300){
    return jsonDecode(response.body);
  }
  throw Exception("Server returned ${response.statusCode}: ${response.body}");
  }
}