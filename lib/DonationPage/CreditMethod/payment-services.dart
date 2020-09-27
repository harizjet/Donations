import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';

class StripeTransactionResponse {
  String message;
  bool success;

  StripeTransactionResponse({this.message, this.success});
}

class StripeService {
  static bool confirmation = true;

  static String apiBase = 'https://api.stripe.com//v1';
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  static String secret =
      'sk_test_51HT9DKBkpcFYD0eeCsBsyJ3IHtIm1MuIKZdxFWE3iMsRuf4eDIoDteIreH387ZE7t7GTv0R6llgH93REsvRZcMDJ00RctRfCfo';

  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  static init() {
    StripePayment.setOptions(
      StripeOptions(
          publishableKey:
              'pk_test_51HT9DKBkpcFYD0ee48ENvkDhYMBwDbVCR9GZmF85QScBob4EpD9bSpF9SiWZHmijXjJMdbI8ixoNffFWUc7BE9dv002m8XAsWk'),
    );
  }

  // static Future<StripeTransactionResponse> payViaFpx(
  //     {String amount, String currency, String payment_method_types}) async {
  //   var paymentIntent =
  //       await StripeService.createPaymentIntent(amount, currency, 'fpx');
  //   var response = await StripePayment.confirmPaymentIntent(
  //       PaymentIntent(
  //         clientSecret: paymentIntent['client_secret'],
  //         paymentMethodId: paymentMethod.id,
  //       ),
  //     );

  // }

  static Future<StripeTransactionResponse> payViaExistingCard(
      {String amount, String currency, CreditCard card}) async {
    try {
      var paymentMethod = await StripePayment.createPaymentMethod(
        PaymentMethodRequest(card: card),
      );
      var paymentIntent =
          await StripeService.createPaymentIntent(amount, currency, 'card');
      var response = await StripePayment.confirmPaymentIntent(
        PaymentIntent(
          clientSecret: paymentIntent['client_secret'],
          paymentMethodId: paymentMethod.id,
        ),
      );
      if (response.status == "succeeded") {
        return new StripeTransactionResponse(
          message: 'Transaction successful',
          success: true,
        );
      } else {
        return new StripeTransactionResponse(
          message: 'Transaction successful',
          success: false,
        );
      }
    } on PlatformException catch (err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
        message: 'Transaction failed',
        success: false,
      );
    }
  }

  static Future<StripeTransactionResponse> payWithNewCard({
    String amount,
    String currency,
  }) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());

      // if (confirmation == true) {
      //   var paymentIntent =
      //       await StripeService.createPaymentIntent(amount, currency, 'card');
      //   var response = await StripePayment.confirmPaymentIntent(
      //     PaymentIntent(
      //       clientSecret: paymentIntent['client_secret'],
      //       paymentMethodId: paymentMethod.id,
      //     ),
      //   );

      //   if (response.status == "succeeded") {
      //     return new StripeTransactionResponse(
      //       message: 'Transaction successful',
      //       success: true,
      //     );
      //   } else {
      //     return new StripeTransactionResponse(
      //       message: 'Transaction successful',
      //       success: false,
      //     );
      //   }
      // }

    } on PlatformException catch (err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
        message: 'Transaction failed',
        success: false,
      );
    }
  }

  static getPlatformExceptionErrorResult(err) {
    String message = 'Something went wrong';
    if (err.code == 'cancelled') {
      message = 'Transaction cancelled';
    }
    return new StripeTransactionResponse(
      message: message,
      success: false,
    );
  }

  static Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency, String card) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': card,
      };

      var response = await http.post(
        StripeService.paymentApiUrl,
        body: body,
        headers: StripeService.headers,
      );
      return jsonDecode(response.body);
    } catch (err) {
      print('err charing user: ${err.toString()}');
    }

    return null;
  }
}
