// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:acme_inc/utils/constant.dart';

class TaskCheckbox extends StatelessWidget {
  final String label;
  final bool isDone;
  final ValueChanged onChange;
  const TaskCheckbox({
    super.key,
    required this.label,
    required this.isDone,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            side: BorderSide(color: AppConstant.lightBlueColor!),
            value: isDone,
            shape: CircleBorder(),
            activeColor: AppConstant.darkBlueColor,
            checkColor: AppConstant.whiteColor,
            splashRadius: 0,
            onChanged: onChange,
          ),
          Text(
            label,
            style: GoogleFonts.arimo(
              color: AppConstant.darkBlueColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
