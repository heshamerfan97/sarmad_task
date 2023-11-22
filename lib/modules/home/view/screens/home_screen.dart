import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarmad_task/app_bloc.dart';
import 'package:sarmad_task/modules/home/controllers/users_controller.dart';
import 'package:sarmad_task/modules/home/controllers/home_view_controller.dart';
import 'package:sarmad_task/modules/home/models/user.dart';
import 'package:sarmad_task/modules/home/view/components/user_grid_shimmer.dart';
import 'package:sarmad_task/modules/home/view/components/user_grid_tile.dart';
import 'package:sarmad_task/modules/home/view/components/user_search_bottom_sheet.dart';
import 'package:sarmad_task/modules/home/view/components/user_tile_shimmer.dart';
import 'package:sarmad_task/modules/home/view/components/user_tile.dart';
import 'package:sarmad_task/shared/views/components/sarmad_bottom_sheet.dart';
import 'package:sarmad_task/shared/views/components/sarmad_text_field.dart';
import 'package:sarmad_task/shared/views/helpers/palette.dart';
import 'package:sarmad_task/shared/views/helpers/space.dart';
import 'package:sarmad_task/shared/views/helpers/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    // 20 is the crossAxisSpacing and 32 is the page padding
    final gridWidth = (deviceWidth - 20 - 32) / 2;
    return BlocBuilder<UsersCubit, List<User>?>(
      builder: (context, users) {
        return Scaffold(
          backgroundColor: Palette.lightGrey,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () =>
                            SarmadBottomSheet(context: context, child: UserSearchBottomSheet()).showSarmadModalSheet(),
                        child: SizedBox(
                          width: deviceWidth * 0.8,
                          child: SarmadTextField(
                            enabled: false,
                            hint: "Click here to search for a user",
                            suffixIcon: Icon(
                              Icons.search,
                              color: Palette.primary,
                            ),
                          ),
                        ),
                      ),
                      HorizontalSpace(10),
                      BlocBuilder<HomeViewCubit, bool>(builder: (ctx, isListView) {
                        return InkWell(
                          onTap: () => AppBloc.homeViewCubit.toggleView(),
                          child: Icon(
                            isListView ? Icons.grid_view : Icons.list,
                            color: Palette.primary,
                          ),
                        );
                      }),
                    ],
                  ),
                  const VerticalSpace(10),
                  Expanded(
                    child: (users?.isEmpty ?? false)
                        ? Center(
                            child: Text(
                            "Try Searching for a user",
                            style: TextStyles.basePrimaryStyle,
                          ))
                        : BlocBuilder<HomeViewCubit, bool>(
                            builder: (ctx, isListView) {
                              return isListView
                                  ? ListView.builder(
                                      itemBuilder: (ctx, index) =>
                                          users == null ? UserTileShimmer() : UserTile(users[index]),
                                      itemCount: users == null ? 5 : users.length,
                                    )
                                  : GridView.builder(
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          childAspectRatio: (gridWidth / 300)),
                                      shrinkWrap: true,
                                      itemBuilder: (ctx, index) => users == null
                                          ? UserGridShimmer()
                                          : UserGridTile(
                                              users[index],
                                            ),
                                      itemCount: users == null ? 8 : users.length,
                                    );
                            },
                          ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
