// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:acme_inc/utils/constant.dart';

class ActivityWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final int count;
  final bool isCall;
  const ActivityWidget({
    super.key,
    this.isCall = false,
    required this.title,
    required this.icon,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.1,
        width: MediaQuery.sizeOf(context).width * 0.3,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppConstant.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isCall
                ? Row(
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.arimo(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppConstant.darkGreyColor,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(radius: 8, backgroundColor: Colors.green),
                      SizedBox(width: 1),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: AppConstant.skinColor,
                      ),
                      SizedBox(width: 1),

                      CircleAvatar(
                        radius: 8,
                        backgroundColor: AppConstant.skinColor,
                      ),
                    ],
                  )
                : Text(
                    title,
                    style: GoogleFonts.arimo(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppConstant.darkGreyColor,
                    ),
                  ),
            Row(
              children: [
                Icon(icon, color: AppConstant.blackColor, size: 18),
                SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    text: "$count ",
                    style: GoogleFonts.arimo(
                      fontSize: 14,
                      color: AppConstant.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: "new",
                        style: GoogleFonts.arimo(
                          fontSize: 12,
                          color: AppConstant.darkGreyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
