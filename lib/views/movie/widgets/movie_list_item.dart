import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';
import 'package:project_setup_flutter_getx/utils/app_constants.dart';

import '../../../model/movie_data.dart';
import '../../../style/color_constants.dart';
import '../../../style/text_styles.dart';

class MovieListItem extends StatelessWidget {
  final MovieData data;

  const MovieListItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        shadowColor: ColorConstants.blue13.withOpacity(0.4),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 1,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageFade(
                  image: data.backdropPath == null
                      ? null
                      : NetworkImage(AppConstants.movieDbImageBaseUrl +
                          data.backdropPath!),
                  syncDuration: const Duration(milliseconds: 150),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  scale: 2,
                  // displayed when an error occurs:
                  errorBuilder: (context, error) => Container(
                    color: const Color(0xFF6F6D6A),
                    alignment: Alignment.center,
                    child:
                    const Icon(Icons.warning, color: Colors.black26, size: 128.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.originalTitle ?? "", style: textRegular),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.overview ?? "",
                    style: textRegular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ).paddingAll(8),
            )
          ],
        ),
      ),
    );
  }
}
