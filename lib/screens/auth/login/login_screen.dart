import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crm_demo/api_service/connectivity/no_internet_screen.dart';
import 'package:crm_demo/custom_widgets/custom_buttom.dart';
import 'package:crm_demo/screens/auth/forget_password/forget_password.dart';
import 'package:crm_demo/screens/auth/login/login_provider.dart';
import 'package:crm_demo/utils/nav_utail.dart';
import 'package:crm_demo/utils/res.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoInternetScreen(
      child: Scaffold(
          backgroundColor: Colors.white,
          key: context.watch<LoginProvider>().scaffoldKey,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100.h),
                    Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Please login to continue",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    TextField(
                      controller:
                          context.watch<LoginProvider>().emailTextController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Enter Phone Number",
                        prefixIcon: Icon(Icons.phone, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: context.watch<LoginProvider>().email != null,
                        child: Text(
                          context.watch<LoginProvider>().email ?? "",
                          style: const TextStyle(color: Colors.red),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    TextField(
                      controller:
                          context.watch<LoginProvider>().passwordTextController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText:
                          !context.read<LoginProvider>().passwordVisible,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        prefixIcon: Icon(Icons.lock, color: Colors.grey),
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(
                            context.watch<LoginProvider>().passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            context.read<LoginProvider>().passwordVisibility();
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    Visibility(
                        visible:
                            context.watch<LoginProvider>().password != null,
                        child: Text(
                          context.watch<LoginProvider>().password ?? "",
                          style: const TextStyle(color: Colors.red),
                        )),
                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<LoginProvider>().getUserInfo(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 180.h),
                    Center(
                      child: Text(
                        "© 2025 Tirupati Group. All rights reserved",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "V 1.0.0",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}