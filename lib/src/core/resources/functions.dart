import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../animations/page_transition.dart';
import 'pallet.dart';

class NavigateClass {
  pushScreen({required BuildContext context, Widget? screen}) {
    Navigator.push(context, PreviewSlideRoute(preview: screen!, duration: 0));
  }

  pushRemoveScreen({required BuildContext context, Widget? screen}) {
    Navigator.pushAndRemoveUntil(context,
        PreviewSlideRoute(preview: screen!, duration: 0), (route) => true);
  }
}

dismissKeyboard(context) => dismissKeyboardFocus;

void dismissKeyboardFocus() {
  FocusManager.instance.primaryFocus!.unfocus();
}



class NotifyUser {
  showMessage(BuildContext context, {required String message}) {
    final snackBar = SnackBar(
      backgroundColor: Palette.primaryColor,
      content: Text(
        message,
        style: const TextStyle(
            fontFamily: "MT",
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Palette.accentColor),
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

String emptyEmailField({String fieldType = "Email"}) =>
    '$fieldType field cannot be empty!';

ImageProvider UserAvatarImageProvider(String imageUrl) {
  if (imageUrl.isEmpty) return const AssetImage("AppAssets.profile");
  return CachedNetworkImageProvider(imageUrl);
}


