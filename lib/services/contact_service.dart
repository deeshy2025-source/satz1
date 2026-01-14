import 'dart:convert';
import 'package:http/http.dart' as http;

class ContactService {
  // ✅ Function URL اللي طلع عندك
  static const String _baseUrl =
      'https://us-central1-staz-v1.cloudfunctions.net/contactSendEmails';

  static Future<void> sendQuickForm({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String message,
  }) async {
    final res = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "firstName": firstName.trim(),
        "lastName": lastName.trim(),
        "email": email.trim(),
        "phone": phone.trim(),
        "message": message.trim(),
      }),
    );

    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception(res.body);
    }
  }
}
