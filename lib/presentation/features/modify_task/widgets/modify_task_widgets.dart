import 'package:flutter/material.dart';
import 'package:to_do/core/app-colors/palette.dart';

class ModifyTaskWidgets {
  static Widget appBar() {
    return AppBar(
      backgroundColor: Colors.transparent, // Make the AppBar transparent
      elevation: 0, // Remove the shadow
      leading: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 20, top: 0),
        decoration: BoxDecoration(
          color: modifyTaskColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            // Add your close button functionality here
          },
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(bottom: 25, top: 0),
          decoration: BoxDecoration(
            color: modifyTaskColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextButton(
            onPressed: () {
              // Add your "Mark as Complete" button functionality here
            },
            child: const Text(
              "Mark as Complete",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
