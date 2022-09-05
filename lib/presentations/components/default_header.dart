import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DefaultHeader extends StatelessWidget {
  final bool? isLeadingShow;
  final Widget? trailingChild;
  final String? titleText;

  const DefaultHeader({
    Key? key,
    this.isLeadingShow,
    this.trailingChild,
    this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 15,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Visibility(
                visible: isLeadingShow ?? true,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    fit: BoxFit.contain,
                    'assets/images/icons/icon_chevron_left_black.svg',
                  ),
                ),
              ),
            ),
          ),
          Text(
            titleText ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5,
              height: 1,
            ),
          ),
          Positioned(
            right: 15,
            child: trailingChild ?? Container(),
          )
        ],
      ),
    );
  }
}
