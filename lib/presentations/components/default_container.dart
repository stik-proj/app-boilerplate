import 'package:app_boilerplate/presentations/components/default_header.dart';
import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final bool disableSafeArea;
  final Widget? customHeader;

  //default header settings
  final bool isLeadingShow;
  final Widget? trailingChild;
  final String? titleText;
  final Color? headerBackgroundColor;

  const DefaultContainer({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.disableSafeArea = false,
    this.customHeader,
    this.isLeadingShow = true,
    this.trailingChild,
    this.titleText,
    this.headerBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: headerBackgroundColor ?? backgroundColor,
        elevation: 0,
        titleSpacing: 0,
        title: customHeader ??
            DefaultHeader(
              isLeadingShow: isLeadingShow,
              trailingChild: trailingChild,
              titleText: titleText,
            ),
      ),
      body: disableSafeArea
          ? Container(
              child: child,
            )
          : SafeArea(
              child: child,
            ),
    );
  }
}
