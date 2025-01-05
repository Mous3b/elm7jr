import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/manager/cubit/work_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WorkHourNumber extends StatelessWidget {
  const WorkHourNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WorkCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.hourglass_bottom_rounded),
            const Gap(8),
            Text("عدد الساعات", style: AppStyles.styleSemiBold18(context)),
          ],
        ),
        const Gap(16),
        CustomTextField(
          controller: cubit.numberController,
          hintText: "ادخل عدد الساعات",
          keyboardType: TextInputType.number,
          onFieldSubmitted: (value) {
            cubit.setHours(value: value);
          },
          onChanged: (value) {
            _onValueChanged(value, cubit.numberController);
          },
        ),
      ],
    );
  }

  void _onValueChanged(String value, TextEditingController controller) {
    // Parse the entered text to a number
    final parsedValue = double.tryParse(value) ?? 0;

    // Ensure the value is clamped between 0 and 50
    if (parsedValue < 1) {
      controller.text = "1";
    } else if (parsedValue > 12) {
      controller.text = "12";
    }

    // Place the cursor at the end of the text
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }
}
