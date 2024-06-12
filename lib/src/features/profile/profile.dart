import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/resources/functions.dart';
import '../../core/resources/pallet.dart';
import '../../core/resources/ui_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: screenAwareSize(230, context),
                width: screenAwareSize(230, context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Palette.primaryColor),
                  image: DecorationImage(
                    image: UserAvatarImageProvider("user!.image"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            UIHelper.verticalSpaceLargeExtra,
            const UserDetailsTile(
              title: "Berry",
              icon: Icons.person,
            ),
            UIHelper.verticalSpaceSmall,
            const UserDetailsTile(
              title: "Berry@gmail.com",
              icon: Icons.email,
            ),
            UIHelper.verticalSpaceSmall,
            const UserDetailsTile(
              title: "23, Berry",
              icon: Icons.location_city,
            ),
            UIHelper.verticalSpaceSmall,
            const UserDetailsTile(
              title: "0803456789",
              icon: Icons.phone,
            ),

            //
            UIHelper.verticalSpaceMedium,
            //Logout
            // PrimaryButton(
            //   caption: "Logout",
            //   onPressed: () async {
            //     logout();
            //     Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (BuildContext context) =>
            //               Login(settingsController: widget.settingsController),
            //         ));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}


class UserDetailsTile extends StatelessWidget {
  const UserDetailsTile({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Palette.secondaryColor,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
