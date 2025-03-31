import 'package:crm_demo/screens/appFlow/home/crm_home_screen.dart';
import 'package:crm_demo/screens/appFlow/menu/my_account/myaccount_provider.dart';
import 'package:crm_demo/screens/appFlow/menu/my_account/tab/office_tab/office_tab.dart';
import 'package:crm_demo/screens/appFlow/navigation_bar/bottom_nav_controller.dart';
import 'package:crm_demo/utils/nav_utail.dart';
import 'package:crm_demo/utils/res.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatelessWidget {
  final int? tabIndex;

  const MyAccount({super.key, this.tabIndex});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BottomNavController>();

    return ChangeNotifierProvider(
      create: (context) => MyAccountProvider(),
      child: Consumer<MyAccountProvider>(
        builder: (context, provider, _) {
          return WillPopScope(
            onWillPop:
                () => NavUtil.replaceScreen(
                  context,
                  CrmHomeScreen(
                    /*bottomNavigationIndex: controller.currentScreenIndex,*/
                  ),
                ),
            child: DefaultTabController(
              length: 1,
              initialIndex: tabIndex ?? 0,
              child: Scaffold(
                backgroundColor: AppColors.backgroundColor,
                appBar: AppBar(
                  elevation: 1,
                  backgroundColor: AppColors.white,
                  automaticallyImplyLeading: true,
                  centerTitle: false,
                  title: Text(
                    tr("Profile"),
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                   
                    OfficeTab(
                      officialInfo:
                          context.watch<MyAccountProvider>().officialInfo,
                    ),
                    /* PersonalTab(
                      personalInfo:
                          context.watch<MyAccountProvider>().personalInfo,
                    ),*/
                    // FinancialTab(financialInfo: context.watch<MyAccountProvider>().financialInfo,),
                    // EmergencyTeb(emergencyInfo: context.watch<MyAccountProvider>().emergencyInfo,),
                    // const AppreciateTab(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
