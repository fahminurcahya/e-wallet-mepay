import 'package:flutter/material.dart';
import '../../shared/shared_method.dart';
import '../../shared/theme.dart';

class PackageItem extends StatelessWidget {
  final int amount;
  final int price;
  final bool isSelected;

  const PackageItem({
    super.key,
    required this.amount,
    required this.price,
    this.isSelected = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 175,
      padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 22
      ),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 2,
              color: isSelected ? blueColor : whiteColor
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${amount}GB',
            style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            formatCurrency(price),
            style: greyTextStyle.copyWith(
                fontSize: 12
            ),
          )
        ],
      ),
    );
  }
}
