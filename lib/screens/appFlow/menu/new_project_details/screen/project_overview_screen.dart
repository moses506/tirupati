import 'package:crm_demo/screens/appFlow/menu/clients/client_details/client_details_screen.dart';
import 'package:crm_demo/screens/appFlow/menu/clients/model/company_list_model.dart';
import 'package:crm_demo/screens/appFlow/menu/new_project_details/provider/project_overview_provider.dart';
import 'package:crm_demo/screens/appFlow/menu/projects/model/kyc_user_id_kyc_model.dart'
    show KYCUserIdKYCData;
import 'package:crm_demo/screens/appFlow/menu/sales/product/content/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectOverviewScreen extends StatefulWidget {
  final int projectId;
  final KYCUserIdKYCData kYCUserIdKYCData;
  const ProjectOverviewScreen({
    super.key,
    required this.projectId,
    required this.kYCUserIdKYCData,
  });

  @override
  State<ProjectOverviewScreen> createState() => _ProjectOverviewScreenState();
}

class _ProjectOverviewScreenState extends State<ProjectOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectOverViewProvider>(
      builder: (context, provider, _) {
        final projectOverView = provider.projectOverviewDetailsResponse?.data;
        final List<String> titles = ['Mr', 'Mrs', 'Ms'];
        String? selectedTitle = 'Mr';
        final TextEditingController nameController = TextEditingController();
        void dispose() {
          nameController.dispose();
          super.dispose();
        }

        return ListView(
          children: [
            ProfileField(
              icon: Icons.apartment,
              label: "Company Name",
              value: widget.kYCUserIdKYCData.companyName ?? 'N/A',
            ),
            // / Container(
            // /   decoration: BoxDecoration(
            // /     color: Colors.white,
            // /     borderRadius: BorderRadius.circular(10),
            // /   ),
            // /   child:
            // /   CustomDropdown<CompanyData>(
            // /     icon: Icon(Icons.business),
            // /     value: provider.companyData,
            // /     labelText: 'Select Company',
            // /     items: [],
            // /     onChanged: (CompanyData? newValue) {
            // /       provider.selectCompany(newValue!);
            // /     },
            // /     itemLabelBuilder:
            // /         (CompanyData value) => value.companyName ?? '',
            // /   ),
            // / ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedTitle,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    borderRadius: BorderRadius.circular(8.0),
                    items:
                        titles.map((String title) {
                          return DropdownMenuItem<String>(
                            value: title,
                            child: Text(title),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTitle = newValue;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ProfileField(
                    icon: Icons.person,
                    label: "Name",
                    value: widget.kYCUserIdKYCData.name ?? 'N/A',
                  ),
                ),
              ],
            ),

            ProfileField(
              icon: Icons.email,
              label: "Email Id",
              value: widget.kYCUserIdKYCData.email ?? 'N/A',
            ),
            ProfileField(
              icon: Icons.phone,
              label: "Phone Number",
              value: widget.kYCUserIdKYCData.mobile ?? 'N/A',
            ),
            ProfileField(
              icon: Icons.home,
              label: "Address",
              value: widget.kYCUserIdKYCData.address ?? 'N/A',
            ),
            /*buildKYCItem("Name", Icons.person, "Mr Grge"),
            buildKYCItem("Gender", null, "Male"),
            buildKYCItem("Marital Status", null, "Single"),
            buildKYCItem("Father Name / Husband Name", null, "Gege"),
            buildKYCItem("Date of Birth", Icons.cake, "27-03-2025"),
            buildKYCItem("Age", Icons.cake, "0"),
            buildKYCItem("Email Id", null, "example@mail.com"),*/
          ],
        );
      },
    );
  }

  /// Widget to build each KYC detail section
  Widget buildKYCItem(String title, IconData? icon, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              if (icon != null)
                Icon(icon, color: Colors.blue[900]), // Show icon if available
              if (icon != null)
                SizedBox(width: 8), // Space between icon and text
              Text(
                value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
