// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get UserName {
    return Intl.message(
      'UserName',
      name: 'UserName',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter yout UserName`
  String get usernNameHint {
    return Intl.message(
      'Enter yout UserName',
      name: 'usernNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get User {
    return Intl.message(
      'User',
      name: 'User',
      desc: '',
      args: [],
    );
  }

  /// `Customer Name`
  String get CustomerName {
    return Intl.message(
      'Customer Name',
      name: 'CustomerName',
      desc: '',
      args: [],
    );
  }

  /// `Bill Number`
  String get BillNo {
    return Intl.message(
      'Bill Number',
      name: 'BillNo',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get Total {
    return Intl.message(
      'Total Amount',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get EGP {
    return Intl.message(
      'EGP',
      name: 'EGP',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get Code {
    return Intl.message(
      'Code',
      name: 'Code',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get Product {
    return Intl.message(
      'Product',
      name: 'Product',
      desc: '',
      args: [],
    );
  }

  /// `Unit Price`
  String get UnitPrice {
    return Intl.message(
      'Unit Price',
      name: 'UnitPrice',
      desc: '',
      args: [],
    );
  }

  /// `quantity`
  String get Qty {
    return Intl.message(
      'quantity',
      name: 'Qty',
      desc: '',
      args: [],
    );
  }

  /// `total`
  String get totalAmount {
    return Intl.message(
      'total',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Supplier Name`
  String get SupplierName {
    return Intl.message(
      'Supplier Name',
      name: 'SupplierName',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get Paid {
    return Intl.message(
      'Paid',
      name: 'Paid',
      desc: '',
      args: [],
    );
  }

  /// `Rest`
  String get Rest {
    return Intl.message(
      'Rest',
      name: 'Rest',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get Notes {
    return Intl.message(
      'Notes',
      name: 'Notes',
      desc: '',
      args: [],
    );
  }

  /// `Package`
  String get Package {
    return Intl.message(
      'Package',
      name: 'Package',
      desc: '',
      args: [],
    );
  }

  /// `Package quantity`
  String get PackageQty {
    return Intl.message(
      'Package quantity',
      name: 'PackageQty',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Add Supplier`
  String get AddSupplier {
    return Intl.message(
      'Add Supplier',
      name: 'AddSupplier',
      desc: '',
      args: [],
    );
  }

  /// `Enter supplier details`
  String get AddSupplierMsg {
    return Intl.message(
      'Enter supplier details',
      name: 'AddSupplierMsg',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `please Enter supplier Name`
  String get SupplierNameValidator {
    return Intl.message(
      'please Enter supplier Name',
      name: 'SupplierNameValidator',
      desc: '',
      args: [],
    );
  }

  /// `please Enter supplier Phone`
  String get SupplierPhoneValidator {
    return Intl.message(
      'please Enter supplier Phone',
      name: 'SupplierPhoneValidator',
      desc: '',
      args: [],
    );
  }

  /// `please Enter correct supplier Phone`
  String get SupplierPhoneCorrect {
    return Intl.message(
      'please Enter correct supplier Phone',
      name: 'SupplierPhoneCorrect',
      desc: '',
      args: [],
    );
  }

  /// `please Enter  Phone`
  String get PhoneNumberValidator {
    return Intl.message(
      'please Enter  Phone',
      name: 'PhoneNumberValidator',
      desc: '',
      args: [],
    );
  }

  /// `please Enter correct Phone`
  String get PhoneNumberCorrect {
    return Intl.message(
      'please Enter correct Phone',
      name: 'PhoneNumberCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get Reset {
    return Intl.message(
      'Reset',
      name: 'Reset',
      desc: '',
      args: [],
    );
  }

  /// `Expenses Type`
  String get ExpensesType {
    return Intl.message(
      'Expenses Type',
      name: 'ExpensesType',
      desc: '',
      args: [],
    );
  }

  /// `Employee Name`
  String get EmployeeName {
    return Intl.message(
      'Employee Name',
      name: 'EmployeeName',
      desc: '',
      args: [],
    );
  }

  /// `Salary`
  String get Salary {
    return Intl.message(
      'Salary',
      name: 'Salary',
      desc: '',
      args: [],
    );
  }

  /// `Add Employee`
  String get AddEmployee {
    return Intl.message(
      'Add Employee',
      name: 'AddEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Add Employee details`
  String get AddEmployeeMsg {
    return Intl.message(
      'Add Employee details',
      name: 'AddEmployeeMsg',
      desc: '',
      args: [],
    );
  }

  /// `Enter Employee's password`
  String get EmployeePasswordValdation {
    return Intl.message(
      'Enter Employee\'s password',
      name: 'EmployeePasswordValdation',
      desc: '',
      args: [],
    );
  }

  /// `please Enter your password`
  String get PasswordValdation {
    return Intl.message(
      'please Enter your password',
      name: 'PasswordValdation',
      desc: '',
      args: [],
    );
  }

  /// `Enter Employee's name`
  String get EmployeeNameValidation {
    return Intl.message(
      'Enter Employee\'s name',
      name: 'EmployeeNameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Enter Employee's Salary`
  String get EmployeeSalaryValidation {
    return Intl.message(
      'Enter Employee\'s Salary',
      name: 'EmployeeSalaryValidation',
      desc: '',
      args: [],
    );
  }

  /// `Delete Employee`
  String get DeleteEmployee {
    return Intl.message(
      'Delete Employee',
      name: 'DeleteEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure want Delete this Employee ?`
  String get DeleteEmployeeMsg {
    return Intl.message(
      'Are you sure want Delete this Employee ?',
      name: 'DeleteEmployeeMsg',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `Delete Item`
  String get DeleteItem {
    return Intl.message(
      'Delete Item',
      name: 'DeleteItem',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure want Delete this Item ?`
  String get DeleteItemMsg {
    return Intl.message(
      'Are you sure want Delete this Item ?',
      name: 'DeleteItemMsg',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get Delete {
    return Intl.message(
      'Delete',
      name: 'Delete',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get From {
    return Intl.message(
      'From',
      name: 'From',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get To {
    return Intl.message(
      'To',
      name: 'To',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get OK {
    return Intl.message(
      'OK',
      name: 'OK',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get Date {
    return Intl.message(
      'Date',
      name: 'Date',
      desc: '',
      args: [],
    );
  }

  /// `Total Bills`
  String get TotalBills {
    return Intl.message(
      'Total Bills',
      name: 'TotalBills',
      desc: '',
      args: [],
    );
  }

  /// `Delete Customer`
  String get DeleteCustomer {
    return Intl.message(
      'Delete Customer',
      name: 'DeleteCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure want Delete this Customer ?`
  String get DeleteCustomerMsg {
    return Intl.message(
      'Are you sure want Delete this Customer ?',
      name: 'DeleteCustomerMsg',
      desc: '',
      args: [],
    );
  }

  /// `Customer Bills`
  String get CustomerBills {
    return Intl.message(
      'Customer Bills',
      name: 'CustomerBills',
      desc: '',
      args: [],
    );
  }

  /// `Add Customer`
  String get AddCustomer {
    return Intl.message(
      'Add Customer',
      name: 'AddCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Add Customer details`
  String get AddCustomerMsg {
    return Intl.message(
      'Add Customer details',
      name: 'AddCustomerMsg',
      desc: '',
      args: [],
    );
  }

  /// `Enter Customer's name`
  String get CustomerNameValidation {
    return Intl.message(
      'Enter Customer\'s name',
      name: 'CustomerNameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Enter your UserName`
  String get userNameValidator {
    return Intl.message(
      'Enter your UserName',
      name: 'userNameValidator',
      desc: '',
      args: [],
    );
  }

  /// `Sale`
  String get Sale {
    return Intl.message(
      'Sale',
      name: 'Sale',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
