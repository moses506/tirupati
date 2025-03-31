import 'package:crm_demo/api_service/connectivity/no_internet_screen.dart';
import 'package:crm_demo/screens/appFlow/menu/clients/add_client/add_client_provider.dart';
import 'package:crm_demo/screens/appFlow/menu/clients/model/company_list_model.dart';
import 'package:crm_demo/screens/appFlow/menu/sales/product/content/custom_dropdown.dart';
import 'package:crm_demo/screens/custom_widgets/add_client_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../projects/model/admin_list_model.dart' show UserData;

class AddClientScreen extends StatefulWidget {
  final UserData? user;

  AddClientScreen({super.key, this.user});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return NoInternetScreen(
      child: ChangeNotifierProvider(
        create: (context) => AddClientProvider(),
        child: Consumer<AddClientProvider>(
          builder: (context, provider, _) {
            if (widget.user != null) {
              provider.clientNameController.text = widget.user?.userName ?? '';
              provider.clientPhoneNumberController.text =
                  widget.user?.mobile ?? '';
              provider.clientEmailController.text = widget.user?.emailId ?? '';
              provider.clientAddressController.text =
                  widget.user?.address ?? '';

              if (provider.companyListModel.data != null) {
                for (var item in provider.companyListModel.data!) {
                  if (widget.user!.companyId == item.companyId) {
                    provider.selectCompany(item);
                  }
                }
              }
            }
            return Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: const Color(0xffF5F6FA),
              appBar: AppBar(
                elevation: 0,
                title:
                    Text(
                      widget.user != null ? "Edit Admin" : "Add Admin",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ).tr(),
              ),
              body: Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    vertical: 28.h,
                    horizontal: 16.w,
                  ),
                  children: [
                    Text(
                      'Company Name',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomDropdown<CompanyData>(
                        icon: Icon(Icons.business),
                        value: provider.companyData,
                        labelText: 'Select Company',
                        items: provider.companyListModel.data ?? [],
                        onChanged: (CompanyData? newValue) {
                          provider.selectCompany(newValue!);
                        },
                        itemLabelBuilder:
                            (CompanyData value) => value.companyName ?? '',
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    AddClientTextField(
                      hintText: "Enter Name".tr(),
                      textController: provider.clientNameController,
                      prefixIcon: Icons.person, // Person icon
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Phone',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AddClientTextField(
                      hintText: "Enter Phone ".tr(),
                      textController: provider.clientPhoneNumberController,
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone, // Phone icon
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      ' Email id',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AddClientTextField(
                      hintText: "Enter Email id".tr(),
                      textController: provider.clientEmailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email, // Email icon
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AddClientTextField(
                      hintText: "Enter Password".tr(),
                      textController: provider.clientPasswordController,
                      prefixIcon: Icons.lock, // Lock icon
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AddClientTextField(
                      hintText: "Enter Address".tr(),
                      textController: provider.clientAddressController,
                      prefixIcon: Icons.house_outlined, // Lock icon
                    ),
                    SizedBox(height: 16.h),

                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await provider.addClient(
                            context,
                            widget.user != null,
                            widget.user?.userid ?? '',
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFD0200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        minimumSize: Size(double.infinity, 60.h),
                      ),
                      child:
                          Text(
                            widget.user != null ? "Update" : "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ).tr(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
