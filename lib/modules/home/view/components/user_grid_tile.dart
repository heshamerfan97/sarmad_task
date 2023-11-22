import 'package:flutter/material.dart';
import 'package:sarmad_task/modules/home/models/user.dart';
import 'package:sarmad_task/shared/views/helpers/space.dart';
import 'package:sarmad_task/shared/views/helpers/text_styles.dart';

class UserGridTile extends StatelessWidget {
  const UserGridTile(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 120,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.network(
                  user.image ??
                      "https://static.vecteezy.com/system/resources/thumbnails/005/545/335/small/user-sign-icon-person-symbol-human-avatar-isolated-on-white-backogrund-vector.jpg",
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, _) =>
                    Image.network("https://static.vecteezy.com/system/resources/thumbnails/005/545/335/small/user-sign-icon-person-symbol-human-avatar-isolated-on-white-backogrund-vector.jpg", fit: BoxFit.fill,)
                  ,
                )),
          ),
          const VerticalSpace(5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyles.baseBlackStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis ,
                ),
                Text("Nationality: ${user.nationality}"),
                Text("Born in: ${user.placeOfBirth}"),
                Text("Score: ${user.score}"),
                Text(user.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
