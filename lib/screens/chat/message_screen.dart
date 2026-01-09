import 'package:acme_inc/common/widgets/icon_text.dart';
import 'package:acme_inc/common/widgets/latest_message_widget.dart';
import 'package:acme_inc/common/widgets/message_input_widget.dart';
import 'package:acme_inc/common/widgets/message_widget.dart';
import 'package:acme_inc/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
            color: AppConstant.darkGreyColor,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppConstant.skinColor,
                ),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(AppConstant.boyImage),
                ),
              ),
            ),
            Text(
              "Maya Chen",
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Card(
              elevation: 2,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppConstant.whiteColor,
                ),
                child: Icon(
                  Icons.headphones_rounded,
                  size: 18,
                  color: AppConstant.darkGreyColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Card(
              elevation: 2,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppConstant.whiteColor,
                ),
                child: Icon(
                  Icons.more_vert_rounded,
                  size: 18,
                  color: AppConstant.darkGreyColor,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppConstant.greyColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Today",

                                style: GoogleFonts.arimo(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: AppConstant.darkGreyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        MessageWidget(
                          name: "Maya",
                          isSender: false,
                          msg: 'Hey Arthur, just sent over the new logo brief',
                          isRepliedTo: false,
                          hasAttachments: true,
                          time: "8.12 AM",
                        ),
                        MessageWidget(
                          name: "You",
                          isSender: true,
                          msg:
                              'Oooh, nice! Can we try a bolder font for the tagline?',
                          isRepliedTo: true,
                          hasAttachments: false,
                          time: '8.15 AM',
                        ),
                        MessageWidget(
                          name: "Maya",
                          isSender: false,
                          msg: "Sure, give me 10 min 👍",
                          isRepliedTo: false,
                          hasAttachments: false,
                          time: '8.18 AM',
                        ),
                        MessageWidget(
                          name: "You",
                          isSender: true,
                          msg: '',
                          isRepliedTo: false,
                          hasAttachments: false,
                          time: '8.20 AM',
                          isAudio: true,
                        ),
                      ],
                    ),

                    Positioned(
                      bottom: 5,
                      left: MediaQuery.sizeOf(context).width * 0.25,
                      right: MediaQuery.sizeOf(context).width * 0.25,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppConstant.darkPinkColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "New 1 unread message",

                          style: GoogleFonts.arimo(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppConstant.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          MessageInput(controller: _searchController),
        ],
      ),

      //  Column(
      //   children: [
      //     Expanded(
      //       child: SizedBox(
      //         // height: MediaQuery.sizeOf(context).height * 0.85,
      //         width: MediaQuery.sizeOf(context).width,
      //         child: SingleChildScrollView(
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(
      //               vertical: 8.0,
      //               horizontal: 10,
      //             ),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(
      //                       "Latest Chats",
      //                       style: GoogleFonts.arimo(
      //                         fontSize: 12,
      //                         fontWeight: FontWeight.w700,
      //                       ),
      //                     ),
      //                     CircleAvatar(
      //                       radius: 15,
      //                       backgroundColor: AppConstant.greyColor,
      //                       child: Icon(
      //                         Icons.layers_rounded,
      //                         size: 18,
      //                         color: AppConstant.darkGreyColor,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(height: 10),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Container(
      //       height: MediaQuery.sizeOf(context).height * 0.13,
      //       width: MediaQuery.sizeOf(context).width,
      //       decoration: BoxDecoration(
      //         color: AppConstant.greyColor,
      //         borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(12),
      //           topRight: Radius.circular(12),
      //         ),
      //       ),
      //       child: Column(
      //         // mainAxisAlignment: MainAxisAlignment.start,
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.only(left: 6, right: 6, top: 2.0),
      //             child: TextField(
      //               controller: _searchController,
      //               cursorColor: AppConstant.blackColor,
      //               expands: false,
      //               minLines: 1,
      //               maxLines: 5,
      //               decoration: InputDecoration(
      //                 filled: true,
      //                 fillColor: AppConstant.greyColor,
      //                 hintText: "Message Maya Chen",
      //                 hintStyle: GoogleFonts.arimo(
      //                   fontSize: 14,
      //                   fontWeight: FontWeight.w500,
      //                   color: AppConstant.darkGreyColor,
      //                 ),
      //                 // prefixIcon: Icon(
      //                 //   Icons.search,
      //                 //   size: 18,
      //                 //   color: AppConstant.darkGreyColor,
      //                 // ),
      //                 // suffixIcon: _searchController.text.isNotEmpty
      //                 //     ? IconButton(
      //                 //         icon: const Icon(Icons.clear),
      //                 //         onPressed: () {
      //                 //           _searchController.clear();
      //                 //         },
      //                 //       )
      //                 //     : null,
      //                 border: const OutlineInputBorder(
      //                   borderRadius: BorderRadius.all(
      //                     Radius.circular(12),
      //                   ), // Stadium shape
      //                   borderSide: BorderSide.none, // Removes outline
      //                 ),
      //                 enabledBorder: const OutlineInputBorder(
      //                   borderRadius: BorderRadius.all(Radius.circular(18)),
      //                   borderSide: BorderSide.none,
      //                 ),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderRadius: const BorderRadius.all(
      //                     Radius.circular(18),
      //                   ),
      //                   borderSide: BorderSide.none,

      //                   // borderSide: BorderSide(
      //                   //   color: AppConstant.greyColor,
      //                   //   width: 1.5,
      //                   // ),
      //                 ),
      //                 contentPadding: const EdgeInsets.symmetric(
      //                   vertical: 14.0,
      //                   horizontal: 8,
      //                 ),
      //               ),
      //               onChanged: (query) {},
      //             ),
      //           ),
      //           SizedBox(height: 5),
      //           Container(
      //             // height: MediaQuery.sizeOf(context).height * 0.025,
      //             width: MediaQuery.sizeOf(context).width,
      //             padding: EdgeInsets.symmetric(horizontal: 16),

      //             child: Row(
      //               children: [
      //                 Icon(
      //                   Icons.attach_file_sharp,
      //                   size: 20,
      //                   color: AppConstant.darkGreyColor,
      //                 ),
      //                 SizedBox(width: 4),
      //                 Icon(
      //                   Icons.image_outlined,
      //                   size: 20,
      //                   color: AppConstant.darkGreyColor,
      //                 ),
      //                 SizedBox(width: 4),

      //                 Icon(
      //                   Icons.file_present_outlined,
      //                   size: 20,
      //                   color: AppConstant.darkGreyColor,
      //                 ),
      //                 SizedBox(width: 4),

      //                 Icon(
      //                   FontAwesomeIcons.at,
      //                   size: 20,
      //                   color: AppConstant.darkGreyColor,
      //                 ),

      //                 Spacer(),
      //                 Container(
      //                   alignment: Alignment.center,
      //                   height: 30,
      //                   width: 60,
      //                   decoration: BoxDecoration(
      //                     color: AppConstant.blackColor,
      //                     borderRadius: BorderRadius.circular(25),
      //                   ),
      //                   child: Icon(
      //                     Icons.arrow_upward_rounded,
      //                     color: AppConstant.whiteColor,
      //                     size: 20,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Spacer(),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
