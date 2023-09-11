import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mepay/shared/theme.dart';
import 'package:mepay/ui/widgets/button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TopupAmountPage extends StatefulWidget {
  const TopupAmountPage({super.key});

  @override
  State<TopupAmountPage> createState() => _TopupAmountPageState();
}

class _TopupAmountPageState extends State<TopupAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;
      if (text.isNotEmpty) {
        amountController.value = amountController.value.copyWith(
            text: NumberFormat.currency(
                    locale: 'id', decimalDigits: 0, symbol: '')
                .format(int.parse(text.replaceAll('.', ''))));
      }
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 58),
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
            child: Text(
              'Total Amount',
              style:
                  whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            ),
          ),
          const SizedBox(
            height: 67,
          ),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: amountController,
                enabled: false,
                cursorColor: greyColor,
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  prefixIcon: Text(
                    'Rp. ',
                    style: whiteTextStyle.copyWith(
                        fontSize: 36, fontWeight: medium),
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 66,
          ),
          Wrap(
            spacing: 60,
            runSpacing: 60,
            children: [
              CustomInputButton(
                onTap: () {
                  addAmount('1');
                },
                title: '1',
              ),
              CustomInputButton(
                onTap: () {
                  addAmount('2');
                },
                title: '2',
              ),
              CustomInputButton(
                onTap: () {
                  addAmount('3');
                },
                title: '3',
              ),
              CustomInputButton(
                onTap: () {
                  addAmount('4');
                },
                title: '4',
              ),
              CustomInputButton(
                onTap: () {
                  addAmount('5');
                },
                title: '5',
              ),
              CustomInputButton(
                onTap: () {
                  addAmount('6');
                },
                title: '6',
              ),
              CustomInputButton(
                onTap: () {
                  addAmount('7');
                },
                title: '7',
              ),
              CustomInputButton(
                onTap: () {
                  addAmount('8');
                },
                title: '8',
              ),
              CustomInputButton(
                onTap: () {
                  addAmount('9');
                },
                title: '9',
              ),
              const SizedBox(
                width: 60,
                height: 60,
              ),
              CustomInputButton(
                onTap: () {
                  addAmount('0');
                },
                title: '0',
              ),
              GestureDetector(
                onTap: () {
                  deleteAmount();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: numberBackgroundColor),
                  child:
                      Center(child: Icon(Icons.arrow_back, color: whiteColor)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: 'Checkout Now',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                await launchUrlString('http://demo.midtrans.com/');
                Navigator.pushNamed(context, '/topup-success');
              }
            },
          ),
          const SizedBox(
            height: 25,
          ),
          const CustomTextButton(
            title: 'Term & Condition',
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
