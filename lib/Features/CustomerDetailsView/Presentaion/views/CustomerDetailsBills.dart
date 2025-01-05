import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportBlockCard.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportM7jarCard.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillsExportStoreCard.dart';
import 'package:elm7jr/Features/BlockView/data/models/block_export_bill_model.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/manager/cubit/customer_bill_cubit.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerPayBillCard.dart';
import 'package:elm7jr/Features/CustomerDetailsView/data/models/customer_pay_model.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:elm7jr/Features/StoreView/data/models/store_export_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDetailsBills extends StatelessWidget {
  const CustomerDetailsBills({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BlocBuilder<CustomerBillCubit, CustomerBillState>(
              builder: (context, state) {
                if (state is CustomerBillLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CustomerBillSuccess) {
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
          )
        ],
      ),
    );
  }

  Widget _buildBillCard(BuildContext context, dynamic bill) {
    if (bill is BlockExportBillModel) {
      return BillExportBlockCard(model: bill, isCustomer: true);
    } else if (bill is StoreExportBillModel) {
      return BillsExportStoreCard(model: bill, isCustomer: true);
    } else if (bill is M7jarItemModel) {
      return BillExportM7jarCard(model: bill, isCustomer: true);
    } else if (bill is CusotmerPayModel) {
      return CustomerPayBillCard(model: bill);
    } else {
      return const SizedBox.shrink();
    }
  }

  DateTime _getBillDate(dynamic bill) {
    if (bill is BlockExportBillModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else if (bill is StoreExportBillModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else if (bill is M7jarItemModel) {
      return bill.dateTime ?? DateTime.now();
    } else if (bill is CusotmerPayModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
  }
}
