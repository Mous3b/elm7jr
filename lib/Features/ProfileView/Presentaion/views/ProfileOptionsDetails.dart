import 'package:elm7jr/Features/AccountantPage/Presentaion/AccountantView.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/BillsView.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/CustomerView.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/HistoryView.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/ImportStoreView.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/ImportView.dart';
import 'package:elm7jr/Features/ProfileView/Presentaion/views/ProfileOptionsCard.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/SuppliersView.dart';
import 'package:flutter/material.dart';

class ProfileOptionsDetails extends StatelessWidget {
  const ProfileOptionsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProfileOptionsCardModel> options = [
      ProfileOptionsCardModel(
          title: "الزبائن", icon: Icons.person, page: const CustomerView()),
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
          title: "توريد المحل",
          icon: Icons.store,
          page: const ImportStoreView()),
      ProfileOptionsCardModel(
          title: "تصفية حسابات",
          icon: Icons.account_balance_wallet_rounded,
          page: const Accountantview()),
      ProfileOptionsCardModel(
          title: "السجل", icon: Icons.history, page: const HistoryView()),
    ];
    return Column(
      children: List.generate(
          options.length,
          (index) => ProfileOptionsCard(
                card: options[index],
              )),
    );
  }
}
