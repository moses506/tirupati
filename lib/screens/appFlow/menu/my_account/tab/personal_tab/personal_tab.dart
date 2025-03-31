import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:crm_demo/custom_widgets/custom_build_profile_details.dart';
import 'package:crm_demo/data/model/response_personal.dart';
import 'package:crm_demo/screens/appFlow/menu/my_account/tab/personal_tab/edit_personal_info/edit_personal_info.dart';
import 'package:crm_demo/screens/appFlow/menu/my_account/tab/personal_tab/personal_provider.dart';
import 'package:crm_demo/utils/nav_utail.dart';
import 'package:crm_demo/utils/res.dart';
import 'package:provider/provider.dart';

class PersonalTab extends StatelessWidget {
  final ResponsePersonal? personalInfo;

  const PersonalTab({Key? key, this.personalInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonalProvider(),
      child: Consumer<PersonalProvider>(builder: (context, provider, _) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Stack(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                      imageUrl: "${provider.profileImage}",
                      placeholder: (context, url) => Center(
                        child:
                            Image.asset("assets/images/placeholder_image.png"),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ],
              )),
              const SizedBox(
                height: 20,
              ),
buildProfileDetails(
  title: tr("gender"),
  description: personalInfo?.data?.gender ?? tr("n/a"),
  icon: Icons.wc, // Gender icon
),
buildProfileDetails(
  title: tr("phone"),
  description: personalInfo?.data?.phone ?? tr("n/a"),
  icon: Icons.phone, // Phone icon
),
buildProfileDetails(
  title: tr("date_of_birth"),
  description: personalInfo?.data?.birthDate ?? tr("n/a"),
  icon: Icons.cake, // Birthday icon
),
buildProfileDetails(
  title: tr("address"),
  description: personalInfo?.data?.address ?? tr("n/a"),
  icon: Icons.home, // Address icon
),
buildProfileDetails(
  title: tr("nationality"),
  description: personalInfo?.data?.nationality ?? tr("n/a"),
  icon: Icons.flag, // Nationality icon
),
buildProfileDetails(
  title: tr("passport"),
  description: personalInfo?.data?.passportNumber ?? tr("n/a"),
  icon: Icons.book, // Passport icon
),
buildProfileDetails(
  title: tr("blood_group"),
  description: personalInfo?.data?.bloodGroup ?? tr("n/a"),
  icon: Icons.bloodtype, // Blood group icon
),

              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    NavUtil.navigateScreen(
                        context, EditPersonalInfo(personalInfo: personalInfo));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.colorPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child:  Text(tr("edit_personal_info"),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      )),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
