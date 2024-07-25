import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wac_task/model/dashboard_data_model/dashboard_data_model.dart';
import 'package:wac_task/service/dashboard_service.dart';

class DashboardViewModel extends ChangeNotifier {
  bool loading = false;
  List<DashboardDataModel>? dashboardDataModelList;

  final DashboardService _dashboardService = DashboardService();

  DashboardViewModel() {
    fetchData();
  }

  Future<void> fetchData() async {
    loading = true;
    notifyListeners();
    try {
      dashboardDataModelList = await _dashboardService.fetchDashboardData();
    } on Exception catch (e) {
      log('something went wrong : $e');
    }
    loading = false;
    notifyListeners();
  }
}
