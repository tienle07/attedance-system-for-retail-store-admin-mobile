import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/view/HRManager/EmployeeManagement/add_employee.dart';
import 'package:staras_manager/view/HRManager/EmployeeManagement/employee_list.dart';
import 'package:staras_manager/view/HRManager/Home/home_screen_hr.dart';
import 'package:staras_manager/view/HRManager/StoreManagement/list_all_store.dart';
import 'package:staras_manager/view/StoreManager/DetailsStore/detail_store.dart';
import 'package:staras_manager/view/StoreManager/Device%20Management/list_machine.dart';
import 'package:staras_manager/view/StoreManager/Home/home_screen_store_manager.dart';
import 'package:staras_manager/view/StoreManager/WorkScheduleEmployee/employee_shift_calender.dart';

class BottomBarManager extends StatefulWidget {
  const BottomBarManager({super.key});

  @override
  BottomBarManagerState createState() => BottomBarManagerState();
}

class BottomBarManagerState extends State<BottomBarManager> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          // Home Page
          HomeScreenManager(),
          DetailsStoreManager(),
          EmployeeShiftCalendar(),
          ListMachine(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? Colors.blueAccent.withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex
                                  ? '${listOfStrings[index]}'
                                  : '',
                              style: kTextStyle.copyWith(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: 20,
                            color: index == currentIndex
                                ? Colors.blueAccent
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.store_mall_directory_outlined,
    Icons.calendar_month_rounded,
    Icons.phone_android_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Store',
    'Schedule',
    'Machine',
  ];
}
