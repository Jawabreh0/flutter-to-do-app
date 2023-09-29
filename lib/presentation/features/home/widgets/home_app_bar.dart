import 'package:flutter/material.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/presentation/widgets/build_svg_icon.dart';
import 'package:todo/core/constants/assset_keys.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Text(
            LangKeys.TASK,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Text(
            LangKeys.HOME,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Spacer(),
          BuildSvgIcon(assetKey: AssetKeys.calenderIcon),
        ],
      ),
    );
  }
}
