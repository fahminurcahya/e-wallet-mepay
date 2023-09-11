import 'package:flutter/material.dart';
import 'package:mepay/shared/theme.dart';

class BankItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isSelected;

  const BankItem({
    super.key,
    required this.imageUrl,
    required this.title,
    this.isSelected = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18
      ),
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 2,
          color: isSelected? blueColor : whiteColor
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageUrl,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '50 min',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold
                ),
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
