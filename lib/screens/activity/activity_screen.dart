import 'package:acme_inc/common/widgets/icon_text.dart';
import 'package:acme_inc/common/widgets/latest_message_widget.dart';
import 'package:acme_inc/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  late final TextEditingController _searchController;
  final List<String> _tabs = ["All", "Mentions", "Threads", "Reactions"];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      animationDuration: Duration(milliseconds: 120),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
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
              child: SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(AppConstant.boyImage),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.85,
              width: MediaQuery.sizeOf(context).width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        width: MediaQuery.sizeOf(context).width,
                        child: ListView(
                          shrinkWrap: true,
                          controller: ScrollController(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            TabBar(
                              tabAlignment: TabAlignment.center,
                              labelPadding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              controller: _tabController,
                              isScrollable: false,
                              tabs: [
                                for (int i = 0; i < _tabs.length; i++)
                                  AnimatedBuilder(
                                    animation: _tabController,
                                    builder: (context, _) {
                                      final isSelected =
                                          _tabController.index == i;
                                      return Tab(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? AppConstant.blackColor
                                                : AppConstant.greyColor,
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
                                          ),
                                          child: Text(_tabs[i]),
                                        ),
                                      );
                                    },
                                  ),
                              ],
                              labelStyle: GoogleFonts.arimo(
                                fontSize: 12,
                                letterSpacing: 0.3,
                              ),

                              overlayColor: WidgetStatePropertyAll(
                                Colors.transparent,
                              ),
                              unselectedLabelStyle: GoogleFonts.arimo(
                                fontSize: 12,
                                letterSpacing: 0.3,
                                color: AppConstant.whiteColor,
                              ),

                              labelColor: AppConstant.whiteColor,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorAnimation: TabIndicatorAnimation.elastic,
                              unselectedLabelColor: AppConstant.blackColor,
                              dividerColor: Colors.transparent,
                              indicatorColor: Colors.transparent,
                              onTap: (index) {},
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Latest messages",
                            style: GoogleFonts.arimo(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: AppConstant.greyColor,
                            child: Icon(
                              Icons.layers_rounded,
                              size: 18,
                              color: AppConstant.darkGreyColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppConstant.darkPinkColor.withValues(
                            alpha: 0.1,
                          ),
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
                                  iconText(
                                    icon: Icons.bubble_chart_sharp,
                                    label: "Channel in",
                                    iconColor: AppConstant.darkPinkColor,
                                  ),
                                  SizedBox(width: 10),
                                  iconText(
                                    icon: Icons.lock,
                                    iconSize: 15,
                                    label: "acme-inc",
                                    iconColor: AppConstant.darkPinkColor,
                                  ),
                                  Spacer(),
                                  Text(
                                    "Sep 12",
                                    style: GoogleFonts.arimo(
                                      fontSize: 10,
                                      color: AppConstant.blackColor,
                                    ),
                                  ),
                                ],
                              ),

                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: LatestMessageWidget(
                                      name: "Alex Rivera",
                                      msg:
                                          "Design updates pushed, take a look!",
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
                                  iconText(
                                    icon: Icons.bubble_chart_sharp,
                                    label: "Channel in",
                                    iconColor: AppConstant.darkGreyColor!,
                                  ),
                                  SizedBox(width: 10),
                                  iconText(
                                    icon: Icons.lock,
                                    iconSize: 15,
                                    label: "acme-inc",
                                    iconColor: AppConstant.darkGreyColor!,
                                  ),
                                  Spacer(),
                                  Text(
                                    "Sep 12",
                                    style: GoogleFonts.arimo(
                                      fontSize: 10,
                                      color: AppConstant.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: LatestMessageWidget(
                                      name: "Alex Rivera",
                                      msg:
                                          "Design updates pushed, take a look!",
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
                                  iconText(
                                    icon: Icons.bubble_chart_sharp,
                                    label: "Channel in",
                                    iconColor: AppConstant.darkGreyColor!,
                                  ),
                                  SizedBox(width: 10),
                                  iconText(
                                    icon: Icons.lock,
                                    iconSize: 15,
                                    label: "acme-inc",
                                    iconColor: AppConstant.darkGreyColor!,
                                  ),
                                  Spacer(),
                                  Text(
                                    "Sep 12",
                                    style: GoogleFonts.arimo(
                                      fontSize: 10,
                                      color: AppConstant.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: LatestMessageWidget(
                                      name: "Alex Rivera",
                                      msg:
                                          "Design updates pushed, take a look!",
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: AppConstant.whiteColor,
            height: MediaQuery.sizeOf(context).height * 0.09,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(thickness: 3, height: 2, color: AppConstant.greyColor),

                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6, top: 8.0),
                  child: TextField(
                    controller: _searchController,
                    cursorColor: AppConstant.blackColor,
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
                        borderRadius: const BorderRadius.all(
                          Radius.circular(18),
                        ),
                        borderSide: BorderSide.none,

                        // borderSide: BorderSide(
                        //   color: AppConstant.greyColor,
                        //   width: 1.5,
                        // ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 14.0,
                      ),
                    ),
                    onChanged: (query) {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
