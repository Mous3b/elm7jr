import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/manager/launchURL.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/manager/supplier_bill_cubit/supplier_bill_cubit.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierPayBtn.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SupplierBillsHeader extends StatelessWidget {
  const SupplierBillsHeader({super.key, required this.supplier});
  final SupplierModel supplier;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SupplierBillCubit>(context);
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
                  width: AppSizes.getWidth(190, context),
                  child: Text("الاسم : ${supplier.name}",
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
                ValueListenableBuilder(
                  valueListenable: cubit.restNotifier,
                  builder: (BuildContext context, double value, Widget? child) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          value.isNegative || value == 0 ? "رصيد :" : "ليه : ",
                          style: AppStyles.styleSemiBold18(context),
                        ),
                        Text(
                          "${value.toInt().abs()} ${S.of(context).EGP}",
                          style: AppStyles.styleSemiBold18(context).copyWith(
                              color: value.isNegative || value == 0
                                  ? Colors.green
                                  : Colors.red),
                        ),
                      ],
                    );
                  },
                ),
                const Gap(16),
                SupplierPayBtn(supplier: supplier)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
