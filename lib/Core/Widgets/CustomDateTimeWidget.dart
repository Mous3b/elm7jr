import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDateTimeWidget extends StatelessWidget {
  const CustomDateTimeWidget({
    super.key,
    this.onSubmit,
    this.controller,
  });
  final dynamic Function(Object?)? onSubmit;
  final DateRangePickerController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 120),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SfDateRangePicker(
          navigationMode: DateRangePickerNavigationMode.scroll,
          controller: controller,
          showActionButtons: true,
          onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
          selectionMode: DateRangePickerSelectionMode.range,
          cancelText: "الغاء",
          confirmText: "تم",
          onSubmit: onSubmit,
          onCancel: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
