import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/fruitsModel.dart';

class FruitService {
  static Future<List<FruitModel>> fetchFruits() async {
    try {
      final response = await http.get(
        Uri.parse('https://mooaaz-shaabaan.github.io/api_fruits/fruits.json'),
      );
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => FruitModel.fromJson(e)).toList();
      } else {
        throw Exception('فشل تحميل البيانات');
      }
    } catch (e) {
      print('Error: $e');
      return []; // رجع لستة فاضية في حالة الخطأ
    }
  }
}
