import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepay/blocs/auth/auth_bloc.dart';
import 'package:mepay/models/sign_up_form_model.dart';
import 'package:mepay/shared/shared_method.dart';
import 'package:mepay/shared/theme.dart';
import 'package:mepay/ui/pages/sign_up_set_profile_page.dart';
import 'package:mepay/ui/widgets/button.dart';
import 'package:mepay/ui/widgets/form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthFailed) {
            showCustomSnacknar(context, state.e);
          }

          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpSetProfilePage(
                  data: SignUpFormModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    pin: '',
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
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
                margin: const EdgeInsets.only(
                  top: 100,
                  bottom: 100,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img_logo_light.png'),
                  ),
                ),
              ),
              Text(
                'Join Us to Unlock\nYour Growth',
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
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      title: 'Full Name',
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
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
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (validate()) {
                          context
                              .read<AuthBloc>()
                              .add(AuthCheckEmail(emailController.text));
                        } else {
                          showCustomSnacknar(
                              context, 'Semua Field Harus Diisi');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              CustomTextButton(
                title: 'Sign In',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/sign-in',
                    (route) => false,
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
