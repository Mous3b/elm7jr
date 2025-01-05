import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Core/Widgets/BasketIconBuilder.dart';
import 'package:elm7jr/Core/Widgets/DateSec.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/AccountantBillsView.dart';
import 'package:flutter/material.dart';

abstract class CustomAppBar {
  static AppBar auth(BuildContext context, {required String title}) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Text(title, style: AppStyles.styleMedium18(context)));
  }

  static AppBar home(BuildContext context, {required String title}) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Text(title,
            style: AppStyles.styleSemiBold18(context)
                .copyWith(color: pKcolor, fontSize: 26)));
  }

  static AppBar store(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text("المحل",
          style: AppStyles.styleSemiBold18(context)
              .copyWith(color: pKcolor, fontSize: 26)),
      actions: const [BasketIconBuilder()],
    );
  }

  static AppBar second(BuildContext context, {required String title}) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: AppStyles.styleSemiBold20(context)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
    );
  }

  static AppBar suppliers(BuildContext context, {required String title}) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: AppStyles.styleSemiBold20(context)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      actions: [
        IconButton(
            onPressed: () {
              CustomDialogMethod.showSupplierForm(context);
            },
            icon: const Icon(Icons.add, color: pKcolor, size: 30))
      ],
    );
  }

  static AppBar pricing(BuildContext context, {required String title}) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: AppStyles.styleSemiBold20(context)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      actions: [
        IconButton(
            onPressed: () {
              CustomDialogMethod.addEditItem(context);
            },
            icon: const Icon(Icons.add, color: pKcolor, size: 30))
      ],
    );
  }

  static AppBar accountant(BuildContext context, {required String title}) {
    // final cubit = BlocProvider.of<AccountantCubit>(context);

    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: AppStyles.styleSemiBold20(context)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      actions: [
        const DateSec(),
        IconButton(
            onPressed: () {
              NavigateToPage.slideFromRight(
                  context: context, page: const AccountantBillsView());
            },
            icon: const Icon(Icons.blinds_closed))
      ],
    );
  }

  static AppBar customerPage(BuildContext context,
      {required String title, dynamic Function(Object?)? onSubmit}) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: AppStyles.styleSemiBold20(context)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      actions: [
        IconButton(
            onPressed: () {
              CustomDialogMethod.showDatePicker(context, onSubmit: onSubmit);
            },
            icon: const Icon(Icons.date_range_rounded)),
      ],
    );
  }

  static AppBar supplierPage(BuildContext context,
      {required String title, dynamic Function(Object?)? onSubmit}) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: AppStyles.styleSemiBold20(context)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      actions: [
        IconButton(
            onPressed: () {
              CustomDialogMethod.showDatePicker(context, onSubmit: onSubmit);
            },
            icon: const Icon(Icons.date_range_rounded)),
      ],
    );
  }

  static AppBar customer(BuildContext context, {required String title}) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: AppStyles.styleSemiBold20(context)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      actions: [
        IconButton(
            onPressed: () {
              CustomDialogMethod.showCustomerForm(context);
            },
            icon: const Icon(Icons.add, color: pKcolor, size: 30)),
      ],
    );
  }

  static AppBar history(BuildContext context, {required String title}) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: AppStyles.styleSemiBold20(context)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      actions: [
        IconButton(
            onPressed: () {
              CustomDialogMethod.showDatePicker(context);
            },
            icon: const Icon(Icons.date_range_rounded)),
      ],
    );
  }

  static AppBar itemPage(BuildContext context, {required String title}) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title,
          style: AppStyles.styleSemiBold18(context)
              .copyWith(color: pKcolor, fontSize: 26)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
    );
  }

  static AppBar import(BuildContext context, {required String title}) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Text(title,
            style: AppStyles.styleSemiBold18(context)
                .copyWith(color: pKcolor, fontSize: 26)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        bottom: TabBar(
          splashBorderRadius: BorderRadius.circular(16),
          unselectedLabelStyle: AppStyles.styleSemiBold18(context)
              .copyWith(color: const Color(0xff5A5A5A)),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: pKcolor,
          indicatorWeight: 4,
          labelColor: pKcolor,
          labelStyle: AppStyles.styleSemiBold20(context)
              .copyWith(color: const Color(0xff5A5A5A)),
          dividerColor: const Color(0xff5A5A5A),
          dividerHeight: 2,
          tabs: const <Widget>[
            Tab(
              text: "المحجر",
            ),
            Tab(
              text: "البلوك",
            ),
          ],
        ));
  }

  static AppBar bills(BuildContext context,
      {required String title, required List<String> tabs}) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Text(title, style: AppStyles.styleSemiBold20(context)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        bottom: TabBar(
          splashBorderRadius: BorderRadius.circular(16),
          unselectedLabelStyle: AppStyles.styleSemiBold18(context)
              .copyWith(color: const Color(0xff5A5A5A)),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: pKcolor,
          indicatorWeight: 4,
          labelColor: pKcolor,
          labelStyle: AppStyles.styleSemiBold20(context)
              .copyWith(color: const Color(0xff5A5A5A)),
          dividerColor: const Color(0xff5A5A5A),
          dividerHeight: 2,
          tabs: List.generate(tabs.length, (index) => Tab(text: tabs[index])),
        ));
  }
}
