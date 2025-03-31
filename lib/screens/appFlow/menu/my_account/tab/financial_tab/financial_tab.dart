import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:crm_demo/custom_widgets/custom_build_profile_details.dart';
import 'package:crm_demo/data/model/response_financial.dart';
import 'package:crm_demo/screens/appFlow/menu/my_account/tab/financial_tab/edit_financial_tab/edit_financial_tab.dart';
import 'package:crm_demo/screens/appFlow/menu/my_account/tab/financial_tab/financial_provider.dart';
import 'package:crm_demo/utils/nav_utail.dart';
import 'package:crm_demo/utils/res.dart';
import 'package:provider/provider.dart';

class FinancialTab extends StatelessWidget {
  final ResponseFinancial? financialInfo;

  const FinancialTab({Key? key, this.financialInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FinancialProvider(),
      child: Consumer<FinancialProvider>(
        builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Center(
                    child: Stack(
                      children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          height: 120, width: 120,
                          fit: BoxFit.cover,
                          imageUrl: "${provider.profileImage}",
                          placeholder: (context, url) => Center(
                          child: Image.asset("assets/images/placeholder_image.png"),
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
  title: tr("tin"),
  description: financialInfo?.data?.tin ?? "N/A",
  icon: Icons.receipt_long, // Tax Identification Number (TIN) icon
),
buildProfileDetails(
  title: tr("bank_name"),
  description: financialInfo?.data?.bankName ?? "N/A",
  icon: Icons.account_balance, // Bank name icon
),
buildProfileDetails(
  title: tr("bank_account_no"),
  description: financialInfo?.data?.bankAccount ?? "N/A",
  icon: Icons.credit_card, // Bank account icon
),

                 buildProfileDetails(
  title: tr("tin"),
  description: financialInfo?.data?.tin ?? "N/A",
  icon: Icons.receipt_long, // Tax Identification Number (TIN) icon
),
buildProfileDetails(
  title: tr("bank_name"),
  description: financialInfo?.data?.bankName ?? "N/A",
  icon: Icons.account_balance, // Bank name icon
),
buildProfileDetails(
  title: tr("bank_account_no"),
  description: financialInfo?.data?.bankAccount ?? "N/A",
  icon: Icons.credit_card, // Bank account icon
),

                 buildProfileDetails(
  title: tr("tin"),
  description: financialInfo?.data?.tin ?? "N/A",
  icon: Icons.receipt_long, // Tax Identification Number (TIN) icon
),
buildProfileDetails(
  title: tr("bank_name"),
  description: financialInfo?.data?.bankName ?? "N/A",
  icon: Icons.account_balance, // Bank name icon
),
buildProfileDetails(
  title: tr("bank_account_no"),
  description: financialInfo?.data?.bankAccount ?? "N/A",
  icon: Icons.credit_card, // Bank account icon
),

                 buildProfileDetails(
  title: tr("tin"),
  description: financialInfo?.data?.tin ?? "N/A",
  icon: Icons.receipt_long, // Tax Identification Number (TIN) icon
),
buildProfileDetails(
  title: tr("bank_name"),
  description: financialInfo?.data?.bankName ?? "N/A",
  icon: Icons.account_balance, // Bank name icon
),
buildProfileDetails(
  title: tr("bank_account_no"),
  description: financialInfo?.data?.bankAccount ?? "N/A",
  icon: Icons.credit_card, // Bank account icon
),

                 buildProfileDetails(
  title: tr("tin"),
  description: financialInfo?.data?.tin ?? "N/A",
  icon: Icons.receipt_long, // Tax Identification Number (TIN) icon
),
buildProfileDetails(
  title: tr("bank_name"),
  description: financialInfo?.data?.bankName ?? "N/A",
  icon: Icons.account_balance, // Bank name icon
),
buildProfileDetails(
  title: tr("bank_account_no"),
  description: financialInfo?.data?.bankAccount ?? "N/A",
  icon: Icons.credit_card, // Bank account icon
),

                 buildProfileDetails(
  title: tr("tin"),
  description: financialInfo?.data?.tin ?? "N/A",
  icon: Icons.receipt_long, // Tax Identification Number (TIN) icon
),
buildProfileDetails(
  title: tr("bank_name"),
  description: financialInfo?.data?.bankName ?? "N/A",
  icon: Icons.account_balance, // Bank name icon
),
buildProfileDetails(
  title: tr("bank_account_no"),
  description: financialInfo?.data?.bankAccount ?? "N/A",
  icon: Icons.credit_card, // Bank account icon
),

                 buildProfileDetails(
  title: tr("tin"),
  description: financialInfo?.data?.tin ?? "N/A",
  icon: Icons.receipt_long, // Tax Identification Number (TIN) icon
),
buildProfileDetails(
  title: tr("bank_name"),
  description: financialInfo?.data?.bankName ?? "N/A",
  icon: Icons.account_balance, // Bank name icon
),
buildProfileDetails(
  title: tr("bank_account_no"),
  description: financialInfo?.data?.bankAccount ?? "N/A",
  icon: Icons.credit_card, // Bank account icon
),

                 buildProfileDetails(
  title: tr("tin"),
  description: financialInfo?.data?.tin ?? "N/A",
  icon: Icons.receipt_long, // Tax Identification Number (TIN) icon
),
buildProfileDetails(
  title: tr("bank_name"),
  description: financialInfo?.data?.bankName ?? "N/A",
  icon: Icons.account_balance, // Bank name icon
),
buildProfileDetails(
  title: tr("bank_account_no"),
  description: financialInfo?.data?.bankAccount ?? "N/A",
  icon: Icons.credit_card, // Bank account icon
),

                 buildProfileDetails(
  title: tr("tin"),
  description: financialInfo?.data?.tin ?? "N/A",
  icon: Icons.receipt_long, // Tax Identification Number (TIN) icon
),
buildProfileDetails(
  title: tr("bank_name"),
  description: financialInfo?.data?.bankName ?? "N/A",
  icon: Icons.account_balance, // Bank name icon
),
buildProfileDetails(
  title: tr("bank_account_no"),
  description: financialInfo?.data?.bankAccount ?? "N/A",
  icon: Icons.credit_card, // Bank account icon
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
                            context, EditFinancialTab(financialInfo: financialInfo));
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.colorPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child:  Text(tr("editFinancial_info"),
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
        },
      ),
    );
  }
}
