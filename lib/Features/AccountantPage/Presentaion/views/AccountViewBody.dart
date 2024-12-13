import 'package:elm7jr/Features/AccountantPage/Presentaion/views/AccountExportList.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/AccountImportList.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountExportList(),
            Gap(16),
            AccountImportList(),
          ],
        ),
      ),
    );
  }
}
