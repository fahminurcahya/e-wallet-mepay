import 'package:flutter/cupertino.dart';
import 'package:mepay/shared/theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconurl;
  final String title;
  final VoidCallback? onTap;
  const ProfileMenuItem({
    super.key,
    required this.iconurl,
    required this.title,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 30
        ),
        child: Row(
          children: [
            Image.asset(
              iconurl,
              width: 24,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontWeight: medium
              ),
            )
          ],
        ),
      ),
    );
  }
}
