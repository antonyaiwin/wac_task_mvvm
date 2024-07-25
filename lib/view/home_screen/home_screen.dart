import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_task/core/constants/image_constants.dart';
import 'package:wac_task/global_widgets/dummy_page.dart';
import 'package:wac_task/view_model/home_screen_view_model.dart';

import 'widgets/bubble_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<HomeScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: const Color(0xff92C848),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DummyPage(label: 'Cart'),
              ),
            );
          },
          icon: const ImageIcon(
            AssetImage(cartIconPng),
            size: 26,
          ),
        ),
        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 5),
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ]),
          clipBehavior: Clip.hardEdge,
          height: 24,
          child: TextField(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DummyPage(label: 'Search'),
              ),
            ),
            enabled: false,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              suffixIcon: Icon(
                Icons.search,
                size: 15,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DummyPage(label: 'Notifications'),
                ),
              );
            },
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: provider.controller,
        itemBuilder: (context, index) => provider.pages[index],
        itemCount: provider.pages.length,
      ),
      bottomNavigationBar: const BubbleBottomNavBar(),
    );
  }
}
