import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepay/blocs/auth/auth_bloc.dart';
import 'package:mepay/shared/theme.dart';
import 'package:mepay/ui/pages/data_package_page.dart';
import 'package:mepay/ui/pages/data_provider_page.dart';
import 'package:mepay/ui/pages/data_success_page.dart';
import 'package:mepay/ui/pages/home_page.dart';
import 'package:mepay/ui/pages/onboarding_page.dart';
import 'package:mepay/ui/pages/pin_page.dart';
import 'package:mepay/ui/pages/profile_edit_page.dart';
import 'package:mepay/ui/pages/profile_edit_pin_page.dart';
import 'package:mepay/ui/pages/profile_edit_success.dart';
import 'package:mepay/ui/pages/profile_page.dart';
import 'package:mepay/ui/pages/sign_in_page.dart';
import 'package:mepay/ui/pages/sign_up_page.dart';
import 'package:mepay/ui/pages/sign_up_success_page.dart';
import 'package:mepay/ui/pages/splash_page.dart';
import 'package:mepay/ui/pages/topup_amount_page.dart';
import 'package:mepay/ui/pages/topup_page.dart';
import 'package:mepay/ui/pages/topup_success_page.dart';
import 'package:mepay/ui/pages/transfer_amount_page.dart';
import 'package:mepay/ui/pages/transfer_page.dart';
import 'package:mepay/ui/pages/transfer_succes_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle:
                blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            iconTheme: IconThemeData(color: blackColor),
          ),
        ),
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccess(),
          '/topup': (context) => const TopupPage(),
          '/topup-amount': (context) => const TopupAmountPage(),
          '/topup-success': (context) => const TopupSuccessPage(),
          '/transfer': (context) => const TransferPage(),
          '/transfer-amount': (context) => const TransferAmountPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/data-provider': (context) => const DataProviderPage(),
          '/data-package': (context) => const DataPackagePage(),
          '/data-success': (context) => const DataSuccesPage(),
        },
      ),
    );
  }
}
