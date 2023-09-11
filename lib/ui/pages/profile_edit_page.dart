import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widgets/button.dart';
import '../widgets/form.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit profile',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(
                bottom: 50.0
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomFormField(
                  title: 'Username',
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomFormField(
                  title: 'Full Name',
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomFormField(
                  title: 'Email Address',
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomFormField(
                  title: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Update Now',
                  onPressed: (){
                    Navigator.pushNamed(context, '/profile-edit-success');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
