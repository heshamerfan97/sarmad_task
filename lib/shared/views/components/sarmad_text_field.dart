import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarmad_task/shared/views/helpers/text_styles.dart';


typedef SarmadValidator = String? Function(String?);
typedef SarmadOnChanged = void Function(String);

class SarmadTextField extends StatefulWidget {
  const SarmadTextField({
    Key? key,
    this.borderColor,
    this.cursorColor,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.hint,
    this.label,
    this.hintStyle,
    this.textStyle,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.controller,
    this.autofillHints,
    this.obscure = false,
    this.enabled = true,
    this.underlined = false,
    this.keyboardType,
    this.textInputAction,
    this.borderWidth = 0.5,
    this.maxLength,
    this.textAlign,
    this.focusNode,
    this.contentPadding,
    this.isDense = false,
  }) : super(key: key);
  final Color? borderColor, fillColor, cursorColor;
  final Widget? suffixIcon, prefixIcon;
  final String? hint, label;
  final TextStyle? hintStyle, textStyle;
  final SarmadValidator? validator;
  final SarmadOnChanged? onChanged;
  final void Function()? onTap, onEditingComplete;
  final TextEditingController? controller;
  final Iterable<String>? autofillHints;
  final bool obscure, enabled, underlined, isDense;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double borderWidth;
  final int? maxLength;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;

  @override
  State<SarmadTextField> createState() => _SarmadTextFieldState();
}

class _SarmadTextFieldState extends State<SarmadTextField> {
  late bool obscure;

  @override
  void initState() {
    obscure = (widget.obscure == true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final outlinedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: widget.borderColor ?? Colors.transparent, width: widget.borderWidth));
    final underlinedBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: widget.borderColor ?? Colors.transparent, width: widget.borderWidth));
    return AutofillGroup(
      child: TextFormField(
        focusNode: widget.focusNode,
        textAlign: widget.textAlign ?? TextAlign.start,
        obscureText: obscure,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        autofillHints: widget.autofillHints,
        autofocus: false,
        onEditingComplete: widget.onEditingComplete,
        decoration: InputDecoration(
          border: widget.underlined ? underlinedBorder : outlinedBorder,
          enabledBorder: widget.underlined ? underlinedBorder : outlinedBorder,
          errorBorder: (widget.underlined ? underlinedBorder : outlinedBorder).copyWith(borderSide: BorderSide(color: Colors.red, width: widget.borderWidth)),
          errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
          focusedBorder: (widget.underlined ? underlinedBorder : outlinedBorder)
              .copyWith(borderSide: BorderSide(width: widget.borderWidth * 2)),
          labelText: widget.label,
          labelStyle: TextStyles.basePrimaryStyle,
          suffixIcon: widget.obscure
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  child: (widget.suffixIcon ??
                      Icon(
                        obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: obscure ? Colors.grey : Colors.lightBlueAccent,
                      )),
          )
              : widget.suffixIcon==null?null:ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.zero, right: const Radius.circular(10)),
            child: widget.suffixIcon,
          ),
          prefixIcon: widget.prefixIcon,
          hintText: widget.hint,
          contentPadding: widget.contentPadding??const EdgeInsets.fromLTRB(21, 14, 21, 17),
          filled: widget.fillColor != null,
          fillColor: widget.fillColor,
          hintStyle: widget.hintStyle ?? TextStyles.hintStyle,
          isDense: widget.isDense,
        ),
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        style: widget.textStyle ?? TextStyles.baseBlackStyle,
        enabled: widget.enabled,
        inputFormatters: [
         if(widget.maxLength!=null) LengthLimitingTextInputFormatter(widget.maxLength),
        ],
        cursorColor: widget.cursorColor,
      ),
    );
  }
}
