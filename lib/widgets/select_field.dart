import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';

class SelectField<T> extends StatelessWidget {
  const SelectField({
    super.key,
    this.value,
    this.textStyle,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.hintStyle,
    this.isExpanded = false,
  });
  final T? value;
  final TextStyle? textStyle;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T? value)? onChanged;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool isExpanded;

  // TODO do this later
  // static Widget sizedBox<T>({
  //   double? width,
  //   double? height,
  //   T? value,
  //   TextStyle? textStyle,
  //   List<DropdownMenuItem<T>>? items,
  //   void Function(T? value)? onChanged,
  //   String? hintText,
  //   TextStyle? hintStyle,
  // }) {
  //   final expanded = height != null;

  //   return SizedBox(
  //     width: width,
  //     height: height,
  //     child: SelectField(
  //       value: value,
  //       textStyle: textStyle,
  //       hintText: hintText,
  //       hintStyle: hintStyle,
  //       isExpanded: expanded,
  //       items: items,
  //       onChanged: onChanged,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final ts = textStyle ??
        TextStyle(
          color: ThemeApp.colors(context).text,
          fontSize: 12,
          letterSpacing: 3.9,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        );

    final hs = hintStyle ?? ts.copyWith(color: ts.color?.withOpacity(.7));

    return DropdownButtonFormField<T>(
      value: value,
      style: ts,
      hint: hintText.hasValue ? Text(hintText!, style: hs) : null,
      isExpanded: isExpanded,
      items: items,
      onChanged: onChanged,
    );
  }
}
