import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: () {
        // logoutdialogMethode(context);
      },
      leading: const Icon(
        Icons.logout,
        color: Color.fromARGB(255, 212, 21, 7),
      ),
      title: Text("الخروج",
          style: AppStyles.styleSemiBold20(context)
              .copyWith(color: const Color.fromARGB(255, 212, 21, 7))),
    );
  }
}
