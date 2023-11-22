import 'package:flutter/material.dart';
import 'package:sarmad_task/shared/views/helpers/space.dart';
import 'package:shimmer/shimmer.dart';

class UserTileShimmer extends StatelessWidget {
  const UserTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Name Shimmer
              Container(
                width: double.infinity,
                height: 20.0,
                color: Colors.white,
              ),
              VerticalSpace(8),

              ///Nationality Shimmer
              Container(
                width: 150,
                height: 14.0,
                color: Colors.white,
              ),
              VerticalSpace(8),

              ///Place Of Birth Shimmer
              Container(
                width: 150,
                height: 14.0,
                color: Colors.white,
              ),
              VerticalSpace(8),

              ///Score Shimmer
              Container(
                width: 150,
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
          )),
    );
  }
}
