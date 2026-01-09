import 'package:acme_inc/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;

  const MessageInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
      decoration: BoxDecoration(
        color: AppConstant.greyColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 🔥 VERY IMPORTANT
        children: [
          /// TEXT FIELD
          TextField(
            controller: controller,
            cursorColor: AppConstant.blackColor,

            /// 🔥 allows expansion
            minLines: 1,
            maxLines: 5,

            decoration: InputDecoration(
              filled: true,
              fillColor: AppConstant.greyColor,
              hintText: "Message Maya Chen",
              hintStyle: GoogleFonts.arimo(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppConstant.darkGreyColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),

          const SizedBox(height: 6),

          /// ACTION ROW
          Row(
            children: [
              _icon(Icons.attach_file_sharp),
              _icon(Icons.image_outlined),
              _icon(Icons.file_present_outlined),
              _icon(FontAwesomeIcons.at, iconSize: 16),

              const Spacer(),

              Container(
                height: 34,
                width: 60,
                decoration: BoxDecoration(
                  color: AppConstant.blackColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {double iconSize = 20}) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Icon(icon, size: iconSize, color: AppConstant.darkGreyColor),
    );
  }
}
