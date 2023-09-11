import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepay/blocs/auth/auth_bloc.dart';
import 'package:mepay/models/sign_in_form_model.dart';
import 'package:mepay/shared/theme.dart';
import 'package:mepay/ui/widgets/button.dart';
import 'package:mepay/ui/widgets/form.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
              Container(
                width: 155,
                height: 50,
                margin: const EdgeInsets.only(top: 100, bottom: 100),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img_logo_light.png'))),
              ),
              Text(
                'Sign In &\nGrow Your Finance',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                margin: const EdgeInsets.only(bottom: 50.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      title: 'Email Address',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot password',
                        style: blueTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Sign In',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthLogin(
                                SignInFormModel(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              ),
                            );
                      },
                    )
                  ],
                ),
              ),
              CustomTextButton(
                title: 'Create New Account',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign-up', (route) => false);
                },
              )
            ],
          );
        },
      ),
    );
  }
}
