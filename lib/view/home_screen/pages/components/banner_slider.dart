import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dynamic_carousel_indicator/dynamic_carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_task/model/dashboard_data_model/dashboard_data_model.dart';
import 'package:wac_task/view_model/banner_slider_view_model.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key, required this.data});
  final DashboardDataModel data;
  @override
  Widget build(BuildContext context) {
    log(data.contents?[0].imageUrl ?? 'not');
    return ChangeNotifierProvider(
      create: (BuildContext context) => BannerSliderViewModel(),
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              CarouselSlider.builder(
                itemCount: data.contents?.length ?? 0,
                itemBuilder: (context, index, realIndex) => CachedNetworkImage(
                  imageUrl: data.contents?[index].imageUrl ?? '',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 981 / 549,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    context
                        .read<BannerSliderViewModel>()
                        .onCarouselIndexChanged(index);
                  },
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 8,
                child: Consumer<BannerSliderViewModel>(
                  builder: (context, viewModel, child) => Center(
                    child: DynamicCarouselIndicator(
                      pageIndex: viewModel.currentIndex,
                      count: data.contents?.length ?? 0,
                      dotColor: const Color(0xffBEBABA),
                      activeDotColor: const Color(0xffF5F5F5),
                      dotWidth: 4,
                      dotHeight: 4,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
