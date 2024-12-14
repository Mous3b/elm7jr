import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/manager/import_store_cubit/import_store_cubit.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/ImportItemPage.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/ImportStoreSummary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportStoreBottomSec extends StatelessWidget {
  const ImportStoreBottomSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ImportStoreCubit>(context);

    return ValueListenableBuilder(
      valueListenable: cubit.indexNotifier,
      builder: (BuildContext context, int value, Widget? child) {
        if (value == 1) {
          return const ImportStoreSummary();
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "اضافة منتج",
                      txtcolor: pKcolor,
                      btncolor: Colors.white,
                      onPressed: () {
                        NavigateToPage.slideFromBottom(
                            context: context, page: const ImportItempage());
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: CustomButton(
                      text: " التالى",
                      txtcolor: Colors.white,
                      btncolor: pKcolor,
                      onPressed: () {
                        cubit.setIndex(index: 1);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
