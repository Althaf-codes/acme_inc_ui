// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:acme_inc/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesWidget extends StatelessWidget {
  final String label;
  const NotesWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.08,
      width: MediaQuery.sizeOf(context).width * 0.175,
      decoration: BoxDecoration(
        color: AppConstant.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppConstant.darkYellowColor!.withValues(alpha: 0.4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.arimo(
                color: AppConstant.darkYellowColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 8),
            Divider(
              height: 2,
              thickness: 4,
              endIndent: 2,
              color: AppConstant.darkYellowColor?.withValues(alpha: 0.2),
            ),
            SizedBox(height: 6),
            Divider(
              height: 2,
              thickness: 4,
              color: AppConstant.darkYellowColor?.withValues(alpha: 0.2),
              endIndent: 10,
            ),

            Spacer(),

            Divider(
              height: 2,
              thickness: 4,
              color: AppConstant.darkYellowColor?.withValues(alpha: 0.2),
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }
}
