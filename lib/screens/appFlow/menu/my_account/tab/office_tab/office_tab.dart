import 'package:crm_demo/custom_widgets/custom_build_profile_details.dart';
import 'package:crm_demo/data/model/response_offical_info.dart';
import 'package:crm_demo/screens/appFlow/menu/my_account/tab/office_tab/office_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OfficeTab extends StatelessWidget {
  final ResponseOfficialInfo? officialInfo;

  const OfficeTab({Key? key, this.officialInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OfficeTabProvider(),
      child: Consumer<OfficeTabProvider>(
        builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                buildProfileDetails(
  title: tr("name"),
  description: provider.name ?? tr("n/a"),
  icon: Icons.person,
),
buildProfileDetails(
  title: tr("email"),
  description: provider.emailId ?? tr("n/a"),
  icon: Icons.email,
),
buildProfileDetails(
  title: tr("mobile"),
  description: provider.mobile ?? tr("n/a"),
  icon: Icons.phone,
),
buildProfileDetails(
  title: tr("address"),
  description: provider.companyName ?? tr("n/a"),
  icon: Icons.home,
),
                /* buildProfileDetails(
                  title: tr("manager"),
                  description: officialInfo?.data?.manager ?? tr("n/a"),
                ),
                buildProfileDetails(
                  title: tr("date_of_joining"),
                  description: officialInfo?.data?.joiningDate ?? tr("n/a"),
                ),
                buildProfileDetails(
                  title: tr("employee_type"),
                  description: officialInfo?.data?.employeeType ?? tr("n/a"),
                ),
                buildProfileDetails(
                  title: tr("employee_id"),

                  description: officialInfo?.data?.employeeId ?? tr("n/a"),
                ),
                buildProfileDetails(
                  title: tr("grade"),
                  description: officialInfo?.data?.grade ?? tr("n/a"),
                ),*/
                /*const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      NavUtil.navigateScreen(
                        context,
                        EditOfficialInfo(officialInfo: officialInfo),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      tr("edit_official_info"),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      NavUtil.navigateScreen(
                        context,
                        const ChangePasswordProfile(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      tr("change_password"),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),*/
              ],
            ),
          );
        },
      ),
    );
  }
}
