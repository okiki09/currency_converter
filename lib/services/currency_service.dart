import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  // Free API - no key required for basic usage
  static const String _baseUrl = 'https://api.exchangerate-api.com/v4/latest';

  Future<Map<String, dynamic>?> getExchangeRates(String baseCurrency) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/$baseCurrency'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['rates'] as Map<String, dynamic>?;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}