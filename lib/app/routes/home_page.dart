import 'package:conectacontea/app/routes/settings/settingsPage.dart';
import 'package:conectacontea/app/services/auth.dart';
import 'package:conectacontea/app/widgets/custom_appBar.dart';
import 'package:conectacontea/app/widgets/custom_buttons.dart';
import 'package:conectacontea/app/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  void _goToSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SettingsPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: const Color(0xffE3F2FD),
        actions: [
          SettingsButton(
            onPressed: () => _goToSettings(context),
          )
        ],
      ),
      backgroundColor: const Color(0xffE3F2FD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomHomeButtonContainer(
            aspectRatio: 10 / 8,
            pathImage: 'assets/images/hablar.png',
            onPressed: () {},
          ),
          CustomHomeButtonContainer(
            aspectRatio: 10 / 3,
            pathImage: 'assets/images/call.png',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
