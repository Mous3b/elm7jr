import 'package:elm7jr/Features/AccountantPage/Presentaion/AccountantView.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/BillsView.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/CustomerView.dart';
import 'package:elm7jr/Features/DriversView/Presentaion/DriversView.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/HistoryView.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/ImportStoreView.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/ImportView.dart';
import 'package:elm7jr/Features/PricingView/Presentaion/PricingView.dart';
import 'package:elm7jr/Features/ProfileView/Presentaion/views/ProfileOptionsCard.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/SuppliersView.dart';
import 'package:flutter/material.dart';

class ProfileOptionsDetails extends StatelessWidget {
  const ProfileOptionsDetails({super.key});
  static List<ProfileOptionsCardModel> options = [
    ProfileOptionsCardModel(
        title: "الزبائن", icon: Icons.person, page: const CustomerView()),
    ProfileOptionsCardModel(
        title: "السائقين", icon: Icons.drive_eta, page: const DriversView()),
    ProfileOptionsCardModel(
        title: "الموردين",
        icon: Icons.account_circle,
        page: const SuppliersView()),
    ProfileOptionsCardModel(
        title: "الفواتير",
        icon: Icons.wysiwyg_rounded,
        page: const BillsView()),
    ProfileOptionsCardModel(
        title: "التوريد",
        icon: Icons.vertical_align_bottom,
        page: const ImportView()),
    ProfileOptionsCardModel(
        title: "توريد المحل", icon: Icons.store, page: const ImportStoreView()),
    ProfileOptionsCardModel(
        title: "تصفية حسابات",
        icon: Icons.account_balance_wallet_rounded,
        page: const Accountantview()),
    ProfileOptionsCardModel(
        title: "التسعير",
        icon: Icons.attach_money_rounded,
        page: const PricingView()),
    ProfileOptionsCardModel(
        title: "السجل", icon: Icons.history, page: const HistoryView()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          options.length,
          (index) => ProfileOptionsCard(
                card: options[index],
              )),
    );
  }
}
