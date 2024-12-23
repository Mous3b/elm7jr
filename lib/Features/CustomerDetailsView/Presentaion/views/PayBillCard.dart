import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PayBillCard extends StatelessWidget {
  const PayBillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("المستخدم :محمود",
                    style: AppStyles.styleMedium16(context)),
                const Spacer(),
                Text("التاريخ :20/10/2024",
                    style: AppStyles.styleMedium16(context)),
              ],
            ),
            const Gap(8),
            Text(
              "الواصل :200 ج.م",
              style: AppStyles.styleSemiBold16(context)
                  .copyWith(color: Colors.green),
            ),
            const Gap(8),
            Text(
              "الملاحظات : واصل ثمن حساب سابق",
              style: AppStyles.styleSemiBold16(context),
            ),
          ],
        ),
      ),
    );
  }
}
