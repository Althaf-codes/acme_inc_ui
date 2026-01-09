// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:acme_inc/common/widgets/waveform_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:acme_inc/utils/constant.dart';

class MessageWidget extends StatelessWidget {
  final String name;
  final String msg;
  final bool isSender;
  final bool isRepliedTo;
  final bool hasAttachments;
  final String time;
  final bool isAudio;
  const MessageWidget({
    super.key,
    required this.name,
    required this.msg,
    required this.isSender,
    required this.isRepliedTo,
    required this.hasAttachments,
    required this.time,
    this.isAudio = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: isSender ? 30 : 8,
          right: isSender ? 8 : 30,
          top: 4,
          bottom: 4,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Column(
            children: [
              Align(
                alignment: isSender ? Alignment.topRight : Alignment.topLeft,
                child: Text(
                  name,
                  style: GoogleFonts.arimo(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppConstant.blackColor,
                  ),
                ),
              ),
              SizedBox(height: 5),

              Container(
                alignment: isSender ? Alignment.topRight : Alignment.topLeft,
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: isSender
                      ? AppConstant.whiteColor
                      : AppConstant.greyColor,
                  border: Border.all(
                    color: AppConstant.darkGreyColor!.withValues(alpha: 0.2),
                    style: isSender ? BorderStyle.solid : BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: isAudio
                    ? SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppConstant.blackColor,
                              radius: 12,
                              child: Icon(
                                Icons.play_arrow_rounded,
                                size: 18,
                                color: AppConstant.whiteColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(child: WaveFormExample()),
                            SizedBox(width: 5),
                            Text(
                              "0.12",
                              style: GoogleFonts.arimo(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppConstant.blackColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          isRepliedTo
                              ? Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Replied to:",
                                    style: GoogleFonts.arimo(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: AppConstant.blackColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              : SizedBox.shrink(),
                          isRepliedTo ? SizedBox(height: 8) : SizedBox.shrink(),

                          isRepliedTo
                              ? Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2),
                                        ),
                                        color: AppConstant.blackColor,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Expanded(
                                      child: Container(
                                        // height: 35,
                                        // width: 35,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),

                                          color: AppConstant.greyColor,
                                        ),
                                        child: Text(
                                          "Hey Arthur, just sent over the new logo brief",
                                          style: GoogleFonts.arimo(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: AppConstant.blackColor,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                  ],
                                )
                              : SizedBox.shrink(),
                          isRepliedTo ? SizedBox(height: 8) : SizedBox.shrink(),
                          Text(
                            msg,
                            style: GoogleFonts.arimo(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppConstant.blackColor,
                            ),
                          ),
                          hasAttachments
                              ? SizedBox(height: 4)
                              : SizedBox.shrink(),

                          hasAttachments
                              ? Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2),
                                        ),
                                        color: AppConstant.blackColor,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Card(
                                      elevation: 1,
                                      child: Container(
                                        // height: 35,
                                        // width: 35,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: AppConstant.darkGreyColor!
                                                .withValues(alpha: 0.4),
                                          ),
                                          color: AppConstant.whiteColor,
                                        ),
                                        child: Icon(
                                          FontAwesomeIcons.filePdf,
                                          color: AppConstant.blackColor,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4),

                                    Text(
                                      "logo-brief.pdf",
                                      style: GoogleFonts.arimo(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppConstant.blackColor,
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
              ),
              Align(
                alignment: isSender ? Alignment.topRight : Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    time,
                    style: GoogleFonts.arimo(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppConstant.darkGreyColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
