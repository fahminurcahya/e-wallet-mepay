import 'package:flutter/material.dart';
import 'package:mepay/shared/theme.dart';
import 'package:mepay/ui/widgets/home_latest_transaction_item.dart';
import 'package:mepay/ui/widgets/home_service_item.dart';
import 'package:mepay/ui/widgets/home_tips_item.dart';
import 'package:mepay/ui/widgets/home_user_item.dart';

import '../../shared/shared_method.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        notchMargin: 6,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_overview.png',
                width: 20,
                color: blueColor,
              ),
              label: 'Overview'
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_history.png',
                  width: 20,
                ),
                label: 'History'
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_statistic.png',
                  width: 20,
                ),
                label: 'Statistic'
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_reward.png',
                  width: 20,
                ),
                label: 'Reward'
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: purpleColor,
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24
        ),
        children: [
          buildProfile(context),
          buildWalletCard(),
          buildLevel(),
          buildServices(context),
          buildLatestTransaction(),
          buildSendAgain(),
          buildFriendlyTips(),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/profile');
      },
      child: Container(
        margin: const EdgeInsets.only(
          top:40,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Howdy',
                  style: greyTextStyle.copyWith(
                    fontSize: 16
                  ),
                ),
                Text(
                  'Shaynahan',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold
                  ),
                )
              ],
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img_profile.png'
                  ),
                  // fit: BoxFit.cover
                )
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 14,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildWalletCard(){
    return Container(
      width: double.infinity,
      height: 220,
      margin: const EdgeInsets.only(
        top: 30
      ),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
            'assets/img_bg_card.png'
          ),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tess',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            '**** **** **** 1234',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              letterSpacing: 6
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Text(
            'Balance',
            style: whiteTextStyle
          ),
          Text(
            formatCurrency(12500),
            style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLevel(){
    return Container(
      margin: const EdgeInsets.only(
        top: 20
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(
                  fontWeight: medium
                ),
              ),
              const Spacer(),
              Text(
                '55%',
                style: greenTextStyle.copyWith(
                  fontWeight: semiBold
                ),
              ),
              Text(
                ' of ${formatCurrency(20000)}',
                style: blackTextStyle.copyWith(
                    fontWeight: semiBold
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.55,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBackgroundColor,
            ),
          )
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(
        top: 30
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                iconUrl: 'assets/ic_topup.png',
                title: 'Top Up',
                onTap: (){
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_send.png',
                title: 'Send',
                onTap: (){
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: (){},
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (context) => const MoreDialog()
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildLatestTransaction(){
    return Container(
      margin: const EdgeInsets.only(
        top: 30
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transaction',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),

          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(
              top: 14
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor
            ),
            child:  Column(
              children: [
                HomeLatestTrasactionItem(
                  iconUrl: 'assets/ic_transaction_cat1.png',
                  title: 'Top Up',
                  time: 'Yesterday',
                  value: '+ ${formatCurrency(45000, symbol: '')}',
                ),
                HomeLatestTrasactionItem(
                  iconUrl: 'assets/ic_transaction_cat2.png',
                  title: 'Cashback',
                  time: 'Sep 11',
                  value: '+ ${formatCurrency(22000, symbol: '')}',
                ),
                HomeLatestTrasactionItem(
                  iconUrl: 'assets/ic_transaction_cat3.png',
                  title: 'Withdraw',
                  time: 'Sep 2',
                  value: '- ${formatCurrency(5000, symbol: '')}',
                ),
                HomeLatestTrasactionItem(
                  iconUrl: 'assets/ic_transaction_cat4.png',
                  title: 'Transfer',
                  time: 'Aug 27',
                  value: '- ${formatCurrency(123500, symbol: '')}',
                ),
                HomeLatestTrasactionItem(
                  iconUrl: 'assets/ic_transaction_cat5.png',
                  title: 'Electric',
                  time: 'Feb 18',
                  value: '- ${formatCurrency(12200000, symbol: '')}',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSendAgain(){
    return Container(
      margin: const EdgeInsets.only(
        top: 30
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeUserItem(
                  imageUrl: 'assets/img_friend1.png',
                  username: 'yuanita',
                ),
                HomeUserItem(
                  imageUrl: 'assets/img_friend2.png',
                  username: 'jany',
                ),
                HomeUserItem(
                  imageUrl: 'assets/img_friend3.png',
                  username: 'urip',
                ),
                HomeUserItem(
                  imageUrl: 'assets/img_friend4.png',
                  username: 'masa',
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFriendlyTips(){
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 50
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            spacing: 17,
            runSpacing: 18,
            children: [
               HomeTipsItem(
                imageUrl: 'assets/img_tips1.png',
                title: 'Best tips for using a credit card',
                url: 'https://google.com',
              ),
               HomeTipsItem(
                imageUrl: 'assets/img_tips2.png',
                title: 'Best tips for using a credit card',
                url: '',
              ),
               HomeTipsItem(
                imageUrl: 'assets/img_tips3.png',
                title: 'Best tips for using a credit card',
                url: '',
              ),
               HomeTipsItem(
                imageUrl: 'assets/img_tips4.png',
                title: 'Best tips for using a credit card',
                url: '',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 326,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Wrap(
              spacing: 40,
              runSpacing: 25,
              children: [
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_data.png',
                  title: 'Data',
                  onTap: (){
                    Navigator.pushNamed(context, '/data-provider');
                  },
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_water.png',
                  title: 'Water',
                  onTap: (){
                    Navigator.pushNamed(context, '/topup');
                  },
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_stream.png',
                  title: 'Stream',
                  onTap: (){
                    Navigator.pushNamed(context, '/topup');
                  },
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_movie.png',
                  title: 'Movie',
                  onTap: (){
                    Navigator.pushNamed(context, '/topup');
                  },
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_food.png',
                  title: 'Food',
                  onTap: (){
                    Navigator.pushNamed(context, '/topup');
                  },
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_travel.png',
                  title: 'Travel',
                  onTap: (){
                    Navigator.pushNamed(context, '/topup');
                  },
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}


