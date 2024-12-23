import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/manager/launchURL.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierPayBtn.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SupplierBillsHeader extends StatelessWidget {
  const SupplierBillsHeader({super.key, required this.supplier});
  final SupplierModel supplier;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppSizes.getWidth(200, context),
                  child: Text("الاسم : ${supplier.name}${supplier.name}",
                      style: AppStyles.styleSemiBold18(context)),
                ),
                const Gap(8),
                Text("رقم التلفون : ",
                    style: AppStyles.styleSemiBold18(context)),
                const Gap(4),
                InkWell(
                    onTap: () {
                      launchURL("tel:${supplier.phone}");
                    },
                    child: Text(supplier.phone ?? "",
                        style: AppStyles.styleSemiBold16(context)
                            .copyWith(color: Colors.blueAccent))),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "ليه : ",
                      style: AppStyles.styleSemiBold18(context),
                    ),
                    Text(
                      "1000 ${S.of(context).EGP}",
                      style: AppStyles.styleSemiBold18(context)
                          .copyWith(color: Colors.red),
                    ),
                  ],
                ),
                const Gap(8),
                const SupplierPayBtn()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
