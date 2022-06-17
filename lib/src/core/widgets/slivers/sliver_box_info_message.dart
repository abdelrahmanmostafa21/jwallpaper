import 'package:flutter/material.dart';
import 'package:jwallpaper/src/core/widgets/list/index.dart';

/// A message for the beginning or end of a [CustomScrollView].
class SliverBoxInfoMessage extends StatelessWidget {
  const SliverBoxInfoMessage({
    Key? key,
    this.primaryMessage,
    this.secondaryMessage,
  }) : super(key: key);

  final Widget? primaryMessage;
  final Widget? secondaryMessage;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListInfoMessage(
        primaryMessage: primaryMessage,
        secondaryMessage: secondaryMessage,
      ),
    );
  }
}
