import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/constants/assset_keys.dart';

class BuildSvgIcon extends StatelessWidget {
  final String assetKey;

  const BuildSvgIcon({required this.assetKey});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "${AssetKeys.iconsPath}${this.assetKey}${AssetKeys.svgExtension}",
    );
  }
}
