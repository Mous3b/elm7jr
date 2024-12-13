import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar(
      {super.key, this.currentIndex, required this.onItemTapped});
  final int? currentIndex;
  final void Function(int) onItemTapped;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 25,
        onTap: onItemTapped,
        currentIndex: currentIndex ?? 0,
        selectedItemColor: pKcolor,
        unselectedItemColor: const Color(0xff9E9D9D),
        selectedLabelStyle: AppStyles.styleSemiBold16(context),
        showUnselectedLabels: true,
        unselectedLabelStyle: AppStyles.styleSemiBold14(context)
            .copyWith(color: const Color(0xff9E9D9D)),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "الرئيسية",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            label: "المصاريف",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_rounded),
            label: "المحل",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "الحساب",
          ),
        ]);
  }
}
