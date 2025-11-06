import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalDatabase {
  static Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/users.json';
    return File(path);
  }

  // ✅ حفظ مستخدم جديد
  static Future<void> saveUser(Map<String, dynamic> userData) async {
    final file = await _getFile();

    List<dynamic> users = [];
    if (await file.exists()) {
      final content = await file.readAsString();
      if (content.isNotEmpty) {
        users = json.decode(content);
      }
    }

    // تحقق إن الإيميل مش مكرر
    bool exists = users.any((u) => u['email'] == userData['email']);
    if (!exists) {
      users.add(userData);
      await file.writeAsString(json.encode(users));
    } else {
      throw Exception('User already exists');
    }
  }

  // ✅ التحقق من تسجيل الدخول
  static Future<bool> checkUser(String email, String password) async {
    final file = await _getFile();
    if (!await file.exists()) return false;

    final content = await file.readAsString();
    if (content.isEmpty) return false;

    final List<dynamic> users = json.decode(content);
    for (var user in users) {
      if (user['email'] == email && user['password'] == password) {
        return true;
      }
    }
    return false;
  }
}
