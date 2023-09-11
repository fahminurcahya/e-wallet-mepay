import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widgets/button.dart';

class ProfileEditSuccess extends StatelessWidget {
  const ProfileEditSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nice Update!',
              style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Your data is safe whit\nour system',
              style: greyTextStyle.copyWith(
                  fontSize: 16
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomFilledButton(
              width: 183,
              title: 'My profile',
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
