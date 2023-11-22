import 'package:flutter/material.dart';
import 'package:sarmad_task/modules/home/models/user.dart';
import 'package:sarmad_task/shared/views/helpers/text_styles.dart';

class UserTile extends StatelessWidget {
  const UserTile(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        tileColor: Colors.white,
        title:
        Text(user.name, style: TextStyles.baseBlackStyle,),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nationality: ${user.nationality}"),
            Text("Born in: ${user.placeOfBirth}"),
            Text("Score: ${user.score}"),
            Text(user.description),
          ],
        ),
      ),
    );
  }
}
