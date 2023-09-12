import 'package:flutter/material.dart';
import 'package:mepay/models/payment_method_model.dart';
import 'package:mepay/shared/theme.dart';

class BankItem extends StatelessWidget {
  final PaymentMethodModel data;
  final bool isSelected;

  const BankItem({
    super.key,
    required this.data,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
          border:
              Border.all(width: 2, color: isSelected ? blueColor : whiteColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            data.thumbnail!,
            height: 30,
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return const Icon(
                Icons.error,
                size: 30,
              );
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data.name.toString(),
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '50 min',
                style:
                    greyTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
