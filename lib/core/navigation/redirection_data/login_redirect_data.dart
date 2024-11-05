import 'package:gov_client_app/core/navigation/redirection_data/app_redirect_data.dart';

class LoginRedirectData extends AppRedirectData {
  final String? initialMessage;

  LoginRedirectData({
    required super.redirectType,
    this.initialMessage,
  });
}
