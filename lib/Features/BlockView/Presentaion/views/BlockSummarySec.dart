import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/manager/block_cubit/block_cubit.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class BlockSummarySec extends StatefulWidget {
  const BlockSummarySec({super.key});

  @override
  State<BlockSummarySec> createState() => _BlockSummarySecState();
}

class _BlockSummarySecState extends State<BlockSummarySec> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BlockCubit>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      height: _isExpanded
          ? AppSizes.getHeight(265, context)
          : AppSizes.getHeight(60, context), // Adjust height values as needed
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: pKcolor.withValues(alpha: 0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: cubit.totalNotifier,
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return Text(
                        "الاجمالى : ${NumberFormat.currency(locale: 'ar', symbol: "ج.م", decimalDigits: 0).format(value)}",
                        style: AppStyles.styleBold18(context),
                      );
                    },
                  ),
                  const Spacer(),
                  Text(
                    _isExpanded ? "اخفاء التفاصيل" : "عرض التفاصيل",
                    style: AppStyles.styleMedium18(context),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: pKcolor,
                  ),
                ],
              ),
            ),
            if (_isExpanded) ...[
              const Gap(16),
              _buildRow(context, "السعر", cubit.priceNotifier),
              const Gap(16),
              _buildRow(context, "خصم", cubit.discountNotifier),
              const Gap(16),
              _buildRow(context, S.of(context).Rest, cubit.restNotifier),
              const Gap(16),
              CustomButton(
                text: S.of(context).add,
                txtcolor: Colors.white,
                btncolor: pKcolor,
                onPressed: () {
                  cubit.add();
                },
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    String label,
    ValueNotifier<dynamic> notifier,
  ) {
    return Row(
      children: [
        Text(label, style: AppStyles.styleMedium18(context)),
        const Spacer(),
        ValueListenableBuilder(
          valueListenable: notifier,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return Text("$value ${S.of(context).EGP}",
                style: AppStyles.styleMedium18(context));
          },
        ),
      ],
    );
  }
}
