import 'package:flutter/material.dart';
import 'package:sarmad_task/app_bloc.dart';
import 'package:sarmad_task/shared/views/components/sarmad_button.dart';
import 'package:sarmad_task/shared/views/components/sarmad_text_field.dart';
import 'package:sarmad_task/shared/views/helpers/palette.dart';
import 'package:sarmad_task/shared/views/helpers/space.dart';
import 'package:sarmad_task/utils/sailor.dart';

class UserSearchBottomSheet extends StatelessWidget {
  UserSearchBottomSheet({Key? key}):
        super(key: key);
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _middleNameFocusNode = FocusNode();
  final FocusNode _nationalityFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SarmadTextField(
            controller: _firstNameController,
            borderColor: Palette.primary,
            focusNode: _firstNameFocusNode,
            borderWidth: 1,
            label: "First Name*",
            hint: "Please enter first name",
            autofillHints: const [AutofillHints.name],
            textInputAction: TextInputAction.next,
            maxLength: 20,
            onEditingComplete: () {
              _middleNameFocusNode.requestFocus();
            },
            validator: (String? text) {
              if (text?.isEmpty ?? true) {
                return "Required";
              }
              return null;
            },
          ),
          const VerticalSpace(10),
          SarmadTextField(
            controller: _middleNameController,
            borderColor: Palette.primary,
            focusNode: _middleNameFocusNode,
            borderWidth: 1,
            label: "Middle Name*",
            hint: "Please enter middle name",
            autofillHints: const [AutofillHints.middleName],
            textInputAction: TextInputAction.next,
            maxLength: 25,
            onEditingComplete: () {
              _nationalityFocusNode.requestFocus();
            },
            validator: (String? text) {
              if (text?.isEmpty ?? true) {
                return "Required";
              }
              return null;
            },
          ),
          const VerticalSpace(10),
          SarmadTextField(
            controller: _nationalityController,
            borderColor: Palette.primary,
            focusNode: _nationalityFocusNode,
            borderWidth: 1,
            label: "Nationality*",
            hint: "Please Enter user's Nationality",
            autofillHints: const [AutofillHints.countryName],
            textInputAction: TextInputAction.done,
            onEditingComplete: (){
              FocusScope.of(context).unfocus();
            },
            validator: (String? text) {
              if (text?.isEmpty ?? true) {
                return "Required";
              }
              return null;
            },
          ),
          InkWell(
              onTap: () => FocusScope.of(context).unfocus(),
              focusColor: Colors.transparent,
              child: const VerticalSpace(20)),
          SarmadButton(
            onTap: () {
              if (_formState.currentState?.validate() ?? false) {
                AppBloc.usersCubit.searchForUsers(firstName: _firstNameController.text, midName: _middleNameController.text, nationality: _nationalityController.text);
                Sailor.back();
              }
            },
            text: "Search",
            isActive: true,
            color: Palette.primary,
          ),
          InkWell(
              onTap: () => FocusScope.of(context).unfocus(),
              focusColor: Colors.transparent,
              child: const VerticalSpace(20))
        ],
      ),
    );
  }
}
