import 'package:acme_inc/common/widgets/activity_widget.dart';
import 'package:acme_inc/common/widgets/dashed_border_container.dart';
import 'package:acme_inc/common/widgets/latest_message_widget.dart';
import 'package:acme_inc/common/widgets/notes_widget.dart';
import 'package:acme_inc/common/widgets/task_checkbox.dart';
import 'package:acme_inc/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        titleSpacing: 0,
        leading: IconButton(
          iconSize: 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: AppConstant.blackColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              "A",
              style: GoogleFonts.arimo(
                fontSize: 14,
                color: AppConstant.whiteColor,
              ),
            ),
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Acme Inc",
              style: GoogleFonts.arimo(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 5),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, 3),
                  child: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    size: 15,
                    color: AppConstant.blackColor,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -3),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 15,
                    color: AppConstant.blackColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConstant.skinColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ActivityWidget(
                    title: "Channel",
                    icon: Icons.widgets_outlined,
                    count: 2,
                  ),
                  ActivityWidget(
                    title: "Thread",
                    icon: Icons.bubble_chart_sharp,
                    count: 2,
                  ),
                  ActivityWidget(
                    title: "Calls",
                    icon: Icons.phone_callback_rounded,
                    count: 2,
                    isCall: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.2,
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    child: DashedBorderContainer(
                      borderRadius: 16,
                      color: AppConstant.blueColor,
                      strokeWidth: 2,
                      child: ColoredBox(
                        color: AppConstant.lightBlueColor!.withValues(
                          alpha: 0.2,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tasks",
                                    style: GoogleFonts.arimo(
                                      color: AppConstant.darkBlueColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TaskCheckbox(
                                    label: "Ux Audit",
                                    isDone: false,
                                    onChange: (val) {},
                                  ),
                                  TaskCheckbox(
                                    label: "WireFrames",
                                    isDone: false,
                                    onChange: (val) {},
                                  ),
                                  TaskCheckbox(
                                    label: "Hi-Fi",
                                    isDone: false,
                                    onChange: (val) {},
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Card(
                                  elevation: 2,
                                  shape: CircleBorder(),
                                  shadowColor: AppConstant.lightBlueColor,
                                  child: Container(
                                    // height: 20,
                                    // width: 20,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppConstant.whiteColor,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: AppConstant.darkBlueColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    child: DashedBorderContainer(
                      borderRadius: 16,
                      color: AppConstant.darkYellowColor!,
                      strokeWidth: 2,
                      child: ColoredBox(
                        color: AppConstant.lightYellowColor!.withValues(
                          alpha: 0.2,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Notes",
                                    style: GoogleFonts.arimo(
                                      color: AppConstant.darkYellowColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      NotesWidget(label: "Design"),
                                      NotesWidget(label: "Finance"),
                                    ],
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Card(
                                  elevation: 2,
                                  shape: CircleBorder(),
                                  shadowColor: AppConstant.lightYellowColor,
                                  child: Container(
                                    // height: 20,
                                    // width: 20,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppConstant.whiteColor,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: AppConstant.darkYellowColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppConstant.greyColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 8,
                  bottom: 6,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.bubble_chart_sharp,
                          size: 18,
                          color: AppConstant.blackColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Latest messages",
                          style: GoogleFonts.arimo(
                            color: AppConstant.blackColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: LatestMessageWidget(
                            name: "Alex Rivera",
                            msg: "Design updates pushed, take a look!",
                            time: "9:00 AM",
                            count: 4,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8.0),
              child: TextField(
                controller: _searchController,
                cursorColor: AppConstant.greyColor,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppConstant.greyColor,
                  hintText: "Jump to or search",
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppConstant.darkGreyColor,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 18,
                    color: AppConstant.darkGreyColor,
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                          },
                        )
                      : null,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ), // Stadium shape
                    borderSide: BorderSide.none, // Removes outline
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide.none,

                    // borderSide: BorderSide(
                    //   color: AppConstant.greyColor,
                    //   width: 1.5,
                    // ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
                onChanged: (query) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
