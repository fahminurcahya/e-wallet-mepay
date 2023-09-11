import 'package:flutter/material.dart';
import 'package:mepay/shared/theme.dart';
import 'package:mepay/ui/widgets/button.dart';
import 'package:mepay/ui/widgets/form.dart';
import 'package:mepay/ui/widgets/transfer_recent_user_item.dart';
import 'package:mepay/ui/widgets/transfer_result_user_item.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer'
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
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: 'by username',
            isShowTitle : false
          ),
          // buildRecentUsers(),
          buildResult(),
          const SizedBox(
            height: 274,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: (){
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget buildRecentUsers(){
    return Container(
      margin: const EdgeInsets.only(
        top: 40
      ),
      child: Column(
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/img_friend1.png',
            name: 'Yoena Ji',
            username: 'yoena',
            isVerified: true,
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/img_friend2.png',
            name: 'Fara Ji',
            username: 'fara',
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/img_friend3.png',
            name: 'Lodi Ji',
            username: 'lofi',
          )
        ],
      ),
    );
  }

  Widget buildResult(){
    return Container(
      margin: const EdgeInsets.only(
          top: 40
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),
          const Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              TransferResultUserItem(
                imageUrl: 'assets/img_friend1.png',
                name: 'Yoena Ji',
                username: 'yoena',
                isVerified: true,
                isSelected: true,
              ),
              TransferResultUserItem(
                imageUrl: 'assets/img_friend2.png',
                name: 'Fara Ji',
                username: 'fara',
              ),

            ],
          )
        ],
      ),
    );
  }
}
