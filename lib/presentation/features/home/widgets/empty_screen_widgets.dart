import 'package:flutter/material.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/presentation/widgets/build_svg_icon.dart';

class EmptyHomeWidget {
  static Widget emptyHomeBody() {
    return Column(
      children: [
        homeImage(),
        homeMainText(),
        homeSecText(),
      ],
    );
  }

  static Widget homeImage() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 90, bottom: 30),
        child: BuildSvgIcon(assetKey: AssetKeys.emptyHomeImg),
      ),
    );
  }

  static Widget homeMainText() {
    return const Text(
      LangKeys.WHAT_DO_YOU_WANT_TO_DO_TODAY,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  static Widget homeSecText() {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
        LangKeys.TAP_TO_ADD_YOUR_TASKS,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
