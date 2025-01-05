import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportBlockCard.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportM7jarCard.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportStoreCard.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierPayBillCard.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_store_bill_model.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_block_bill.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/manager/supplier_bill_cubit/supplier_bill_cubit.dart';
import 'package:elm7jr/Features/SuppliersBillsView/data/models/supplier_pay_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SupplierBillsSec extends StatelessWidget {
  const SupplierBillsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BlocBuilder<SupplierBillCubit, SupplierBillState>(
              builder: (context, state) {
                if (state is SupplierBillLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SupplierBillSuccess) {
                  final allBills =
                      state.bills.values.expand((bills) => bills).toList();

                  if (allBills.isEmpty) {
                    return Center(
                        child: Text("لا يوجد فواتير",
                            style: AppStyles.styleBold18(context)));
                  }
                  allBills.sort(
                      (a, b) => _getBillDate(b).compareTo(_getBillDate(a)));
                  return ListView.builder(
                    itemCount: allBills.length,
                    itemBuilder: (BuildContext context, int index) {
                      final bill = allBills[index];
                      return _buildBillCard(context, bill);
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
          const Gap(16)
        ],
      ),
    );
  }

  Widget _buildBillCard(
    BuildContext context,
    dynamic bill,
  ) {
    if (bill is ImportBlockBillModel) {
      return BillImportBlockCard(
        model: bill,
        isSupplier: true,
      );
    } else if (bill is ImportStoreBillModel) {
      return BillImportStoreCard(
        model: bill,
        isSupplier: true,
      );
    } else if (bill is SupplierPayModel) {
      return SupplierPayBillCard(
        model: bill,
      );
    } else if (bill is ImportM7jarBillModel) {
      return BillImportM7jarCard(
        model: bill,
        isSupplier: true,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  DateTime _getBillDate(dynamic bill) {
    if (bill is ImportBlockBillModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else if (bill is ImportStoreBillModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else if (bill is SupplierPayModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else if (bill is ImportM7jarBillModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else {
      return DateTime.fromMillisecondsSinceEpoch(0); // Default fallback
    }
  }
}
