import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportM7jarCard.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportM7jarCard.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerPayBillCard.dart';
import 'package:elm7jr/Features/CustomerDetailsView/data/models/customer_pay_model.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/manager/history_cubit/history_cubit.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/views/HistoryExpensesCard.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierPayBillCard.dart';
import 'package:elm7jr/Features/SuppliersBillsView/data/models/supplier_pay_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryListSec extends StatelessWidget {
  const HistoryListSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HistorySuccess) {
            final allBills =
                state.history.values.expand((bills) => bills).toList();
            if (allBills.isEmpty) {
              return Center(
                  child: Text("لا يوجد فواتير",
                      style: AppStyles.styleBold18(context)));
            }
            allBills.sort((a, b) => _getBillDate(b).compareTo(_getBillDate(a)));
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
    );
  }

  /// Builds a grouped section for a specific date

  Widget _buildBillCard(BuildContext context, dynamic bill) {
    if (bill is ImportM7jarBillModel) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(fromatTime(value: bill.date),
                style: AppStyles.styleSemiBold16(context)),
          ),
          BillImportM7jarCard(model: bill)
        ],
      );
    } else if (bill is M7jarItemModel) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(fromatTime(value: bill.dateTime?.toIso8601String()),
                style: AppStyles.styleSemiBold16(context)),
          ),
          BillExportM7jarCard(model: bill)
        ],
      );
    } else if (bill is ExpensesModel && !bill.isBlock!) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(fromatTime(value: bill.dateTime?.toIso8601String()),
                style: AppStyles.styleSemiBold16(context)),
          ),
          HistoryExpensesCard(model: bill)
        ],
      );
    } else if (bill is SupplierPayModel) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(fromatTime(value: bill.date),
                style: AppStyles.styleSemiBold16(context)),
          ),
          SupplierPayBillCard(
            model: bill,
            isHsitory: true,
          )
        ],
      );
    } else if (bill is CusotmerPayModel) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(fromatTime(value: bill.date),
                style: AppStyles.styleSemiBold16(context)),
          ),
          CustomerPayBillCard(
            model: bill,
            isHsitory: true,
          )
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  DateTime _getBillDate(dynamic bill) {
    if (bill is ImportM7jarBillModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else if (bill is M7jarItemModel) {
      return bill.dateTime ?? DateTime.now();
    } else if (bill is M7jarItemModel) {
      return bill.dateTime ?? DateTime.now();
    } else if (bill is ExpensesModel) {
      return bill.dateTime ?? DateTime.now();
    } else if (bill is CusotmerPayModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else if (bill is SupplierPayModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
  }
}
