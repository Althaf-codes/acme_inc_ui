import 'package:acme_inc/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget iconText({
  double iconSize = 18,
  required Color iconColor,
  required IconData icon,
  required String label,
}) {
  return Row(
    children: [
      Icon(icon, size: iconSize, color: iconColor),
      SizedBox(width: 5),
      Text(
        label,
        style: GoogleFonts.arimo(
          color: AppConstant.blackColor,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
