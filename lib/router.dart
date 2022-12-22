import 'package:flutter/material.dart';
import 'package:my_telkomsel_ui/presentation/pages/confirmation_screen.dart';
import 'package:my_telkomsel_ui/presentation/pages/detail_package.dart';
import 'package:my_telkomsel_ui/presentation/pages/internet_screen.dart';
import 'package:my_telkomsel_ui/presentation/pages/omg_screen.dart';
import 'package:my_telkomsel_ui/presentation/pages/payment_method_screen.dart';
import 'package:my_telkomsel_ui/presentation/pages/search_screen.dart';
import 'package:my_telkomsel_ui/presentation/pages/success_transaction_screen.dart';

import 'app_routes.dart';
import 'presentation/pages/home_screen.dart';
import 'presentation/pages/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case AppRoutes.loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case AppRoutes.confirmationScreen:
      final number = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => ConfirmationScreen(numberPhone: number),
      );
    case AppRoutes.internetScreen:
      return MaterialPageRoute(builder: (_) => const InternetScreen());
    case AppRoutes.searchScreen:
      return MaterialPageRoute(builder: (_) => const SearchScreen());
    case AppRoutes.omgScreen:
      return MaterialPageRoute(builder: (_) => const OmgScreen());
    case AppRoutes.detailPackageScreen:
      return MaterialPageRoute(builder: (_) => const DetailPackageScreen());
    case AppRoutes.paymentMethodScreen:
      return MaterialPageRoute(builder: (_) => const PaymentMethodScreen());
    case AppRoutes.successTransactionScreen:
      return MaterialPageRoute(
          builder: (_) => const SuccessTransactionScreen());

    default:
      return MaterialPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text(
              "PAGE NOT FOUND",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      });
  }
}
