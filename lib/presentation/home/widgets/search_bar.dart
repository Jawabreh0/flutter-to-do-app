import 'package:flutter/material.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/presentation/build_svg_icon.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const HomeSearchBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 25, 24, 0),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          labelText: LangKeys.SEARCH_FOR_YOUR_TASK,
          labelStyle: TextStyle(color: Colors.grey),
          prefixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: BuildSvgIcon(assetKey: AssetKeys.searchIcon),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.8,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 0.8,
            ),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
