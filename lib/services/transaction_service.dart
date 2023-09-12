import 'dart:convert';

import 'package:mepay/models/payment_method_model.dart';
import 'package:mepay/services/auth_service.dart';
import 'package:mepay/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/payment_methods'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print(res.body);

      if (res.statusCode == 200) {
        List<PaymentMethodModel> paymentMethods = List<PaymentMethodModel>.from(
          jsonDecode(res.body).map(
            (paymentMethod) => PaymentMethodModel.fromJson(paymentMethod),
          ),
        ).toList();

        return paymentMethods;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
