import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_task/model/dashboard_data_model/dashboard_data_model.dart';
import 'package:wac_task/view/home_screen/pages/components/banner_single.dart';
import 'package:wac_task/view/home_screen/pages/components/banner_slider.dart';
import 'package:wac_task/view/home_screen/pages/components/category_view.dart';

import '../../../view_model/dashboard_view_model.dart';
import 'components/products_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var dashboardViewModel = context.read<DashboardViewModel>();
    return Consumer<DashboardViewModel>(
      builder: (BuildContext context, viewModel, Widget? child) {
        if (dashboardViewModel.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (dashboardViewModel.dashboardDataModelList == null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No data found!'),
              TextButton.icon(
                onPressed: () {
                  dashboardViewModel.fetchData();
                },
                label: const Text('Retry'),
                icon: const Icon(Icons.replay_outlined),
              ),
            ],
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 55),
          itemBuilder: (context, index) {
            var item = dashboardViewModel.dashboardDataModelList![index];
            return getDashboardItemWidget(item);
          },
          itemCount: dashboardViewModel.dashboardDataModelList?.length ?? 0,
        );
      },
    );
  }

  Widget getDashboardItemWidget(DashboardDataModel item) {
    log(item.toString());
    switch (item.type) {
      case 'banner_slider':
        return BannerSlider(data: item);
      case 'products':
        return ProductsView(data: item);
      case 'banner_single':
        return BannerSingle(data: item);
      case 'catagories':
        return CategoryView(data: item);

      default:
        return Container();
    }
  }
}
