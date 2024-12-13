import 'package:elm7jr/Features/ExpensesView/Presentaion/ExpensesView.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/HomeView.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/views/MainNavigationBar.dart';
import 'package:elm7jr/Features/ProfileView/Presentaion/ProfileView.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/StoreView.dart';
import 'package:flutter/material.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  int currentPage = 0;
  void setCurrentPage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  static List<Widget> pages = [
    const HomeView(),
    const ExpensesView(),
    const StoreView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: MainNavigationBar(
        onItemTapped: setCurrentPage,
        currentIndex: currentPage,
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
