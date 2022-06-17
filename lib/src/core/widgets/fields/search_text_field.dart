import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:jwallpaper/src/core/widgets/fields/clearable_text_field.dart';

import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.text,
    this.onSubmitted,
    this.onChanged,
    this.onClear,
    this.hintText,
    this.autofocus = false,
  }) : super(key: key);

  final String? text;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final String? hintText;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = context.watch<AppTheme>();

    final fillColor = theme.brightness == Brightness.light
        ? Colors.black.withOpacity(.05)
        : Colors.white.withOpacity(.05);

    return Container(
      decoration: BoxDecoration(
        color: appTheme.backgroundColors.first,
        borderRadius: BorderRadius.circular(128),
      ),
      child: ClearableTextField(
        text: text,
        autofocus: autofocus,
        onSubmitted: onSubmitted,
        onClear: onClear,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(CupertinoIcons.search, size: 16),
          hintText: hintText,
          filled: true,
          fillColor: fillColor,
          isDense: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: kBorderRadius,
          ),
        ),
      ),
    );
  }
}
