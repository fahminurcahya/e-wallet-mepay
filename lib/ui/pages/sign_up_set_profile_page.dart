import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mepay/models/sign_up_form_model.dart';
import 'package:mepay/shared/theme.dart';
import 'package:mepay/ui/pages/sign_up_set_ktp_page.dart';
import 'package:mepay/ui/widgets/button.dart';
import 'package:mepay/ui/widgets/form.dart';

class SignUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpSetProfilePage({
    super.key,
    required this.data,
  });

  @override
  State<SignUpSetProfilePage> createState() => _SignUpSetProfilePageState();
}

class _SignUpSetProfilePageState extends State<SignUpSetProfilePage> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;
  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.only(top: 100, bottom: 100),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img_logo_light.png'))),
          ),
          Text(
            'Join Us to Unlock\nYour Growth',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(bottom: 50.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Column(
              children: [
                // Container(
                //   height: 120,
                //   width: 120,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: lightBackgroundColor
                //   ),
                //   child: Center(
                //     child: Image.asset(
                //       'assets/ic_upload.png',
                //       width: 32,
                //     ),
                //   ),
                // ),

                GestureDetector(
                  onTap: () {
                    selectImage();
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBackgroundColor,
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(selectedImage!.path)),
                            ),
                    ),
                    child: selectedImage != null
                        ? null
                        : Center(
                            child: Image.asset(
                              'assets/ic_upload.png',
                              width: 32,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Fahmi Nurcahya',
                  style:
                      blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFormField(
                  title: 'Set PIN (6 digit number)',
                  obscureText: true,
                  controller: pinController,
                  isNumberType: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    if (pinController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Field PIN harus diisi',
                          ),
                          backgroundColor: redColor,
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpSetKTPPage(
                            data: widget.data.copyWith(
                              profilePicture: selectedImage == null
                                  ? null
                                  : 'data:image/png;base64,' +
                                      base64Encode(File(selectedImage!.path)
                                          .readAsBytesSync()),
                              pin: pinController.text,
                            ),
                          ),
                        ),
                      );
                    }
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
