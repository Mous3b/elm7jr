import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierBillExpanded.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SupplierBillCard extends StatelessWidget {
  const SupplierBillCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> expandNotifier = ValueNotifier<bool>(false);

    return Card(
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          expandNotifier.value = !expandNotifier.value;
        },
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: expandNotifier.value ? 16 : 6,
          ),
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "الاجمالى :200 ج.م",
                    style: AppStyles.styleSemiBold16(context)
                        .copyWith(color: Colors.green),
                  ),
                  const Spacer(),
                  Text("التاريخ :20/10/2024",
                      style: AppStyles.styleMedium16(context)),
                ],
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الواصل :200 ج.م",
                    style: AppStyles.styleSemiBold14(context),
                  ),
                  Text(
                    "الباقى :200 ج.م",
                    style: AppStyles.styleSemiBold14(context),
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: expandNotifier,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  if (expandNotifier.value) {
                    return const SupplierBillExpanded();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
