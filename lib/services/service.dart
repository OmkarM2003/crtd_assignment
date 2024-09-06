import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class UserService {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(
        Uri.parse('http://13.127.246.196:8000/api/registers/?format=json'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<http.Response> registerUser(Map<String, dynamic> formData) async {
    final response = await http.post(
      Uri.parse('http://13.127.246.196:8000/api/registers/?format=json'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(formData),
    );
    return response;
  }
}
