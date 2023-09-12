import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepay/blocs/auth/auth_bloc.dart';
import 'package:mepay/shared/shared_method.dart';
import 'package:mepay/shared/theme.dart';
import 'package:mepay/ui/pages/profile_edit_page.dart';
import 'package:mepay/ui/pages/profile_edit_pin_page.dart';
import 'package:mepay/ui/widgets/button.dart';
import 'package:mepay/ui/widgets/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
          if (state is AuthFailed) {
            showCustomSnacknar(context, state.e);
          }
        },
        builder: (context, state) {
          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: whiteColor),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: state.data.profilePicture == null
                                  ? const AssetImage(
                                      'assets/img_profile.png',
                                    )
                                  : NetworkImage(state.data.profilePicture!)
                                      as ImageProvider, // fit: BoxFit.cover
                            )),
                        child: state.data.emailVerifiedAt == null
                            ? Container()
                            : Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: whiteColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: greenColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        '${state.data.name}',
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ProfileMenuItem(
                        iconurl: 'assets/ic_edit_profile.png',
                        title: 'Edit Profile',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileEditPage(
                                  user: state.data,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconurl: 'assets/ic_pin.png',
                        title: 'My Pin',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileEditPinPage(
                                  user: state.data,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconurl: 'assets/ic_wallet.png',
                        title: 'Wallet Setting',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconurl: 'assets/ic_reward.png',
                        title: 'My Reward',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconurl: 'assets/ic_help.png',
                        title: 'Help Center',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconurl: 'assets/ic_logout.png',
                        title: 'Logout',
                        onTap: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 87,
                ),
                CustomTextButton(
                  title: 'Report a Problem',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
