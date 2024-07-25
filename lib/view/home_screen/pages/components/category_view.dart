import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wac_task/global_widgets/outlined_container.dart';
import 'package:wac_task/model/dashboard_data_model/dashboard_data_model.dart';

import '../../../../global_widgets/section_header.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.data});
  final DashboardDataModel data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: data.title ?? ''),
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var content = data.contents?[index];
              return AspectRatio(
                aspectRatio: 76 / 64,
                child: OutlinedContainer(
                  child: Column(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: content?.imageUrl ?? '',
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      Text(
                        content?.title ?? '',
                        maxLines: 2,
                        style: GoogleFonts.montserrat(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 5),
            itemCount: data.contents?.length ?? 0,
          ),
        )
      ],
    );
  }
}
