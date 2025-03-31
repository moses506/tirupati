import 'package:crm_demo/screens/appFlow/menu/projects/add_kyc/add_kyc_provider.dart';
import 'package:crm_demo/screens/appFlow/menu/sales/product/content/custom_dropdown.dart';
import 'package:crm_demo/screens/custom_widgets/add_client_textfield.dart';
import 'package:easy_localization/easy_localization.dart'
    show StringTranslateExtension;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDetails extends StatelessWidget {
  final AddKycProvider provider;

  const PersonalDetails({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      children: [
        
        SizedBox(height: 24.h),
        
        // Date of joining
        buildFormLabel('Date of joining'),
        SizedBox(height: 10.h),
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await provider.selectDate(
              context,
              provider.birthDate,
            );
            if (pickedDate != null) {
              provider.updateBirthDate(pickedDate);
            }
          },
          child: AddClientTextField(
            hintText: "DD-MM-YYYY".tr(),
            enabled: false,
            textController: provider.dateOfBirthController,
            prefixIcon: Icons.calendar_today,
          ),
        ),
        
        SizedBox(height: 20.h),
        
        // Date of exit
        buildFormLabel('Date of exit'),
        SizedBox(height: 10.h),
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await provider.selectDate(
              context,
              DateTime.now(),
            );
            if (pickedDate != null) {
              // Add your exit date controller here
            }
          },
          child: AddClientTextField(
            hintText: "DD-MM-YYYY".tr(),
            enabled: false,
            prefixIcon: Icons.calendar_today,
          ),
        ),
        
        SizedBox(height: 20.h),
        
        // Aadhar Card
        buildFormLabel('Aadhar Card Name'),
        SizedBox(height: 10.h),
        AddClientTextField(
          hintText: "Enter Aadhar Number".tr(),
          keyboardType: TextInputType.number,
          prefixIcon: Icons.credit_card,
        ),
        
        SizedBox(height: 20.h),
        
        // Pan Card
        buildFormLabel('Pan Card Name'),
        SizedBox(height: 10.h),
        AddClientTextField(
          hintText: "Enter Pan Number".tr(),
          keyboardType: TextInputType.text,
          prefixIcon: Icons.credit_card,
        ),
        
        SizedBox(height: 20.h),
        
        // UAN
        buildFormLabel('UAN Name'),
        SizedBox(height: 10.h),
        AddClientTextField(
          hintText: "Enter UAN Number".tr(),
          keyboardType: TextInputType.number,
          prefixIcon: Icons.credit_card,
        ),
        
        SizedBox(height: 20.h),
        
        // ESIC
        buildFormLabel('ESIC Name'),
        SizedBox(height: 10.h),
        AddClientTextField(
          hintText: "Enter ESIC Number".tr(),
          keyboardType: TextInputType.number,
          prefixIcon: Icons.credit_card,
        ),
        
        SizedBox(height: 32.h),
        
      
        
      ],
    );
  }

  Widget buildFormLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildHeader(String title, BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        SizedBox(width: 8.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}