import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/HistoryView/data/models/history_model.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.model, this.onDismissed});
  final HistoryModel model;
  final void Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(model),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(12)),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: onDismissed,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Text(" العدد : ${model.qty}",
                      style: AppStyles.styleSemiBold16(context)),
                  const Spacer(),
                  Text("النوع :${model.type}",
                      style: AppStyles.styleSemiBold16(context)),
                  const Spacer(),
                  Text("الواصل : ${model.paid} ج.م",
                      style: AppStyles.styleSemiBold16(context)),
                ],
              ),
              const Divider(height: 16),
              Row(
                children: [
                  Text("اسم الزبون : ${model.customerName}",
                      style: AppStyles.styleSemiBold16(context)),
                  const Spacer(),
                  Text("باقى : ${model.rest} ج.م",
                      style: AppStyles.styleSemiBold16(context)
                          .copyWith(color: Colors.red)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
