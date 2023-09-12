import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepay/blocs/auth/auth_bloc.dart';
import 'package:mepay/blocs/payment_method/payment_method_bloc.dart';
import 'package:mepay/models/payment_method_model.dart';
import 'package:mepay/shared/theme.dart';
import 'package:mepay/ui/widgets/bank_item.dart';
import 'package:mepay/ui/widgets/button.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is AuthSuccess) {
              return Row(
                children: [
                  Image.asset(
                    'assets/img_wallet.png',
                    width: 80,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.data.cardNumber!.replaceAllMapped(
                            RegExp(r".{4}"), (match) => "${match.group(0)} "),
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        state.data.name!,
                        style: greyTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  )
                ],
              );
            } else {
              return Container();
            }
          }),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodSuccess) {
                  return Column(
                    children: state.data.map((paymentMethod) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPaymentMethod = paymentMethod;
                          });
                        },
                        child: BankItem(
                          data: paymentMethod,
                          isSelected:
                              paymentMethod.id == selectedPaymentMethod?.id,
                        ),
                      );
                    }).toList(),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          if (selectedPaymentMethod != null)
            CustomFilledButton(
              title: 'Continue',
              onPressed: () {
                if (selectedPaymentMethod != null) {
                  Navigator.pushNamed(context, '/topup-amount');
                }
              },
            ),
          const SizedBox(
            height: 57,
          )
        ],
      ),
    );
  }
}
