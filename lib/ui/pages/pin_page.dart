import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepay/blocs/auth/auth_bloc.dart';
import 'package:mepay/shared/shared_method.dart';
import 'package:mepay/shared/theme.dart';
import 'package:mepay/ui/widgets/button.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');
  String pin = '';
  bool isError = false;

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }
    if (pinController.text.length == 6) {
      if (pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          isError = true;
        });
        showCustomSnacknar(
            context, 'Pin yang anda masukan salah, Silahkan coba lagi');
      }
    }
  }

  deletePin() {
    setState(() {
      isError = false;
    });
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final state = context.read<AuthBloc>().state;
    if (state is AuthSuccess) {
      pin = state.data.pin!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sha pin',
                style:
                    whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 72,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: pinController,
                  enabled: false,
                  obscureText: true,
                  // cursorColor: greyColor,
                  obscuringCharacter: '*',
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                    letterSpacing: 16,
                    color: isError ? redColor : whiteColor,
                  ),
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: greyColor)),
                  ),
                ),
              ),
              const SizedBox(
                height: 66,
              ),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomInputButton(
                    onTap: () {
                      addPin('1');
                    },
                    title: '1',
                  ),
                  CustomInputButton(
                    onTap: () {
                      addPin('2');
                    },
                    title: '2',
                  ),
                  CustomInputButton(
                    onTap: () {
                      addPin('3');
                    },
                    title: '3',
                  ),
                  CustomInputButton(
                    onTap: () {
                      addPin('4');
                    },
                    title: '4',
                  ),
                  CustomInputButton(
                    onTap: () {
                      addPin('5');
                    },
                    title: '5',
                  ),
                  CustomInputButton(
                    onTap: () {
                      addPin('6');
                    },
                    title: '6',
                  ),
                  CustomInputButton(
                    onTap: () {
                      addPin('7');
                    },
                    title: '7',
                  ),
                  CustomInputButton(
                    onTap: () {
                      addPin('8');
                    },
                    title: '8',
                  ),
                  CustomInputButton(
                    onTap: () {
                      addPin('9');
                    },
                    title: '9',
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  CustomInputButton(
                    onTap: () {
                      addPin('0');
                    },
                    title: '0',
                  ),
                  GestureDetector(
                    onTap: () {
                      deletePin();
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: numberBackgroundColor),
                      child: Center(
                          child: Icon(Icons.arrow_back, color: whiteColor)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
