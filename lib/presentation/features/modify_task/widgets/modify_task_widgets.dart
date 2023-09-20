import 'package:flutter/material.dart';
import 'package:to_do/core/app-colors/palette.dart';

class ModifyTaskWidgets {
  static Widget modifyTaskAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent, // Make the AppBar transparent
      elevation: 0, // Remove the shadow
      leading: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 23, top: 0),
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

  static Widget modifyTaskkBody() {
    return Column(
      children: [
        // First Button
        ElevatedButton.icon(
          onPressed: () {
            // Add your action for the first button here
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent, // Set background color to transparent
            elevation: 0, // Set elevation to zero
          ),
          icon: Image.asset(
              'assets/icons/share.svg'), // Replace with your SVG icon path
          label: Text('Share task'),
        ),

        SizedBox(height: 16), // Add spacing between buttons

        // Second Button
        ElevatedButton.icon(
          onPressed: () {
            // Add your action for the second button here
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent, // Set background color to transparent
            elevation: 0, // Set elevation to zero
          ),
          icon: Image.asset(
              'assets/icons/calendar.svg'), // Replace with your SVG icon path
          label: Text('Calendar'),
        ),

        SizedBox(height: 16), // Add spacing between buttons

        // Third Button
        ElevatedButton.icon(
          onPressed: () {
            // Add your action for the third button here
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent, // Set background color to transparent
            elevation: 0, // Set elevation to zero
          ),
          icon: Image.asset(
              'assets/icons/trash.svg'), // Replace with your SVG icon path
          label: Text('Delete Task'),
        ),
      ],
    );
  }
}
