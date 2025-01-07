import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportBlockCard.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportM7jarCard.dart';
import 'package:elm7jr/Features/BlockView/data/models/block_export_bill_model.dart';
import 'package:elm7jr/Features/DriverDetailsView/Presentaion/manager/driver_bill_cubit/driver_bill_cubit.dart';
import 'package:elm7jr/Features/DriverDetailsView/Presentaion/views/DriverPayCard.dart';
import 'package:elm7jr/Features/DriverDetailsView/data/models/driver_pay_model.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriverDetaillsBills extends StatelessWidget {
  const DriverDetaillsBills({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(child: BlocBuilder<DriverBillCubit, DriverBillState>(
            builder: (context, state) {
              if (state is DriverBillLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DriverBillSuccess) {
                final allBills =
                    state.bills.values.expand((bills) => bills).toList();
                if (allBills.isEmpty) {
                  return Center(
                      child: Text("لا يوجد فواتير",
                          style: AppStyles.styleBold18(context)));
                }
                return ListView.builder(
                  itemCount: allBills.length,
                  itemBuilder: (context, index) {
                    final bill = allBills[index];
                    return _buildBillCard(context, bill);
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ))
        ],
      ),
    );
  }

  Widget _buildBillCard(BuildContext context, dynamic bill) {
    if (bill is BlockExportBillModel) {
      return BillExportBlockCard(model: bill);
    } else if (bill is M7jarItemModel) {
      return BillExportM7jarCard(model: bill);
    } else if (bill is DriverPayModel) {
      return DriverPayCard(model: bill);
    } else {
      return const SizedBox.shrink();
    }
  }
}
