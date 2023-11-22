import 'package:flutter/material.dart';
import 'package:sarmad_task/shared/views/helpers/space.dart';
import 'package:shimmer/shimmer.dart';

class UserGridShimmer extends StatelessWidget {
  const UserGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 120,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                  child: Container(color: Colors.white, height: 120, width: double.infinity,)),
            ),
            const VerticalSpace(5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Name Shimmer
                  Container(
                    width: double.infinity,
                    height: 20.0,
                    color: Colors.white,
                  ),
                  Container(
                    width: 40,
                    height: 20.0,
                    color: Colors.white,
                  ),
                  VerticalSpace(8),

                  ///Nationality Shimmer
                  Container(
                    width: 100,
                    height: 14.0,
                    color: Colors.white,
                  ),
                  VerticalSpace(8),

                  ///Place Of Birth Shimmer
                  Container(
                    width: 100,
                    height: 14.0,
                    color: Colors.white,
                  ),
                  VerticalSpace(8),

                  ///Score Shimmer
                  Container(
                    width: 100,
                    height: 14.0,
                    color: Colors.white,
                  ),
                  VerticalSpace(8),

                  ///Description Shimmer
                  Container(
                    width: double.infinity,
                    height: 20.0,
                    color: Colors.white,
                  ),
                  VerticalSpace(8),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
