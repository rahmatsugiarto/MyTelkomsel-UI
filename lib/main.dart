import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telkomsel_ui/presentation/bloc/confirmation_bloc/confirmation_cubit.dart';
import 'package:my_telkomsel_ui/presentation/bloc/login_bloc/login_cubit.dart';
import 'package:my_telkomsel_ui/presentation/bloc/omg_bloc/omg_cubit.dart';
import 'package:my_telkomsel_ui/presentation/bloc/paymment_method_bloc/paymment_method_cubit.dart';
import 'package:my_telkomsel_ui/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:my_telkomsel_ui/presentation/bloc/success_transaction_bloc/success_transaction_cubit.dart';
import 'package:my_telkomsel_ui/presentation/pages/login_screen.dart';

import 'resources/colors.gen.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light, // For iOS (light icons)
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ConfirmationCubit()),
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => OmgCubit()),
        BlocProvider(create: (_) => PaymentMethodCubit()),
        BlocProvider(create: (_) => SearchCubit()),
        BlocProvider(create: (_) => SuccessTransactionCubit()),
      ],
      child: MaterialApp(
        title: 'Starter',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorName.backgroundScreen,
          primarySwatch: Colors.red,
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorName.backgroundScreen,
            foregroundColor: ColorName.textColor,
            elevation: 0,
            centerTitle: true,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
