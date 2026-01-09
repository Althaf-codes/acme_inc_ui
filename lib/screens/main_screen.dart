import 'package:acme_inc/screens/activity/activity_screen.dart';
import 'package:acme_inc/screens/chat/chat_screen.dart';
import 'package:acme_inc/screens/chat/message_screen.dart';
import 'package:acme_inc/screens/home/home_screen.dart';
import 'package:acme_inc/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    HomeScreen(),
    ChatScreen(),
    // MessageScreen(),
    HomeScreen(),
    ActivityScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        padding: const EdgeInsets.only(left: 14, right: 14),
        color: AppConstant.whiteColor,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i <= 4; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = i;
                  });
                },

                child: i == 2
                    ? Column(
                        children: [
                          const SizedBox(height: 8),
                          AnimatedScale(
                            scale: _currentIndex == 2 ? 1.1 : 1.0,
                            duration: const Duration(milliseconds: 250),
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                color: AppConstant.blackColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Icon(
                                Icons.add,
                                color: AppConstant.whiteColor,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                    : _navItem(i),

                //  i == 2
                //     ? Column(
                //         children: [
                //           SizedBox(height: 8),
                //           Container(
                //             alignment: Alignment.center,
                //             height: 30,
                //             width: 60,
                //             decoration: BoxDecoration(
                //               color: AppConstant.blackColor,
                //               borderRadius: BorderRadius.circular(25),
                //             ),
                //             child: Icon(
                //               Icons.add,
                //               color: AppConstant.whiteColor,
                //               size: 20,
                //             ),
                //           ),
                //           SizedBox(height: 10),
                //         ],
                //       )
                //     : Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           _currentIndex == i
                //               ? Icon(
                //                   _getActiveIcon(i),
                //                   size: 18,
                //                   color: AppConstant.blackColor,
                //                 )
                //               : Icon(
                //                   _getIcon(i),
                //                   size: 18,
                //                   color: AppConstant.darkGreyColor,
                //                 ),

                //           SizedBox(height: 3),
                //           Text(
                //             _getLabel(i),
                //             style: GoogleFonts.arimo(
                //               fontSize: 10,
                //               fontWeight: i == _currentIndex
                //                   ? FontWeight.w600
                //                   : FontWeight.w400,
                //               color: i == _currentIndex
                //                   ? AppConstant.blackColor
                //                   : AppConstant.darkGreyColor,
                //             ),
                //           ),
                //         ],
                //       ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(int i) {
    final bool isActive = _currentIndex == i;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
            scale: isActive ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            child: Icon(
              isActive ? _getActiveIcon(i) : _getIcon(i),
              size: 16,
              color: isActive
                  ? AppConstant.blackColor
                  : AppConstant.darkGreyColor,
            ),
          ),

          const SizedBox(height: 4),

          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            style: GoogleFonts.arimo(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              color: isActive
                  ? AppConstant.blackColor
                  : AppConstant.darkGreyColor,
            ),
            child: Text(_getLabel(i)),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return FontAwesomeIcons.house;
      case 1:
        return FontAwesomeIcons.message;
      case 3:
        return FontAwesomeIcons.bell;
      case 4:
        return Icons.more_outlined;
      default:
        return Icons.home_outlined;
    }
  }

  IconData _getActiveIcon(int index) {
    switch (index) {
      case 0:
        return FontAwesomeIcons.house;
      case 1:
        return FontAwesomeIcons.message;
      case 3:
        return FontAwesomeIcons.bell;
      case 4:
        return Icons.more;
      default:
        return Icons.home;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Chat";
      case 3:
        return "Activity";
      case 4:
        return "More";
      default:
        return "";
    }
  }
}
