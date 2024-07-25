import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wac_task/model/dashboard_data_model/dashboard_data_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../global_widgets/outlined_container.dart';
import '../../../../global_widgets/section_header.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.data});
  final DashboardDataModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: data.title ?? ''),
        SizedBox(
          height: 250,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var content = data.contents?[index];
              return AspectRatio(
                aspectRatio: 96 / 152,
                child: OutlinedContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: content?.productImage ?? '',
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    if (content?.offerPrice != content?.actualPrice)
                      Container(
                        margin: const EdgeInsets.only(
                          top: 5,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 7),
                        decoration: BoxDecoration(
                          color: const Color(0xffFB7B4E),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          content?.discount ?? '',
                          style: GoogleFonts.montserrat(
                            fontSize: 9,
                          ),
                        ),
                      ),
                    const SizedBox(height: 7),
                    Text(
                      content?.productName ?? '',
                      maxLines: 2,
                      style: GoogleFonts.montserrat(
                        fontSize: 9,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: Icon(
                            Icons.star,
                            size: 9,
                            color: (content?.productRating ?? 0) > index
                                ? const Color(0xffFFB038)
                                : const Color(0xffBEBABA),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        Text(
                          content?.offerPrice ?? '',
                          style: GoogleFonts.montserrat(
                            fontSize: 9,
                          ),
                        ),
                        if (content?.offerPrice != content?.actualPrice) ...[
                          const SizedBox(width: 3),
                          Text(
                            content?.actualPrice ?? '',
                            style: GoogleFonts.montserrat(
                              fontSize: 9,
                              color: const Color(0xff736A6A),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                )),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 5),
            itemCount: data.contents?.length ?? 0,
          ),
        )
      ],
    );
  }

  String removeFraction(String input) {
    return double.parse(input).toStringAsFixed(0);
  }
}
