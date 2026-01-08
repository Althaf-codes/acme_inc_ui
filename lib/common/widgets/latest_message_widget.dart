import 'package:acme_inc/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LatestMessageWidget extends StatelessWidget {
  final String name;
  final String msg;
  final String time;
  final int count;
  const LatestMessageWidget({
    super.key,
    required this.name,
    required this.msg,
    required this.time,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstant.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.threeLine,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppConstant.skinColor,
          ),
          child: SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(AppConstant.boyImage),
          ),
        ),
        title: Row(
          children: [
            Text(
              name,
              style: GoogleFonts.arimo(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppConstant.blackColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(width: 5),
            CircleAvatar(radius: 3, backgroundColor: Colors.teal),
          ],
        ),
        subtitle: Text(
          msg,
          style: GoogleFonts.arimo(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppConstant.blackColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: GoogleFonts.arimo(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppConstant.darkGreyColor,
              ),
            ),

            SizedBox(height: 2),
            CircleAvatar(
              radius: 8,
              backgroundColor: AppConstant.darkPinkColor,
              child: Text(
                "$count",
                style: GoogleFonts.arimo(
                  fontSize: 10,
                  color: AppConstant.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
