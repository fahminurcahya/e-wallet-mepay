import 'package:flutter/material.dart';
import 'package:mepay/shared/theme.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final bool isNumberType;

  const CustomFormField({
    super.key,
    required this.title,
    this.obscureText = false,
    this.controller,
    this.isShowTitle = true,
    this.isNumberType = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              contentPadding: const EdgeInsets.all(12.0),
              hintText: !isShowTitle ? title : null),
          obscureText: obscureText,
          controller: controller,
        ),
      ],
    );
  }
}
