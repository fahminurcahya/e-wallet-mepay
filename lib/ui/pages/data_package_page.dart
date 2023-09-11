import 'package:flutter/material.dart';
import 'package:mepay/shared/theme.dart';
import 'package:mepay/ui/widgets/button.dart';
import 'package:mepay/ui/widgets/form.dart';
import 'package:mepay/ui/widgets/package_item.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data'
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
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: '+628',
            isShowTitle: false,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
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
            runSpacing: 17,
            children: [
              PackageItem(
                price: 200000,
                amount: 10,
                isSelected: true,
              ),
              PackageItem(
                price: 100000,
                amount: 5,
              ),
              PackageItem(
                price: 300000,
                amount: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 135,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: ()async{
              if (await Navigator.pushNamed(context, '/pin') == true){
                Navigator.pushNamed(context, '/data-success');
              }
            },
          ),
          const SizedBox(
            height: 57,
          )
        ],
      ),
    );
  }
}
