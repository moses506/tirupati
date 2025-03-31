import 'dart:io';

import 'package:crm_demo/custom_widgets/custom_dialog.dart';
import 'package:crm_demo/screens/appFlow/home/crm_home_screen.dart';
import 'package:crm_demo/screens/appFlow/menu/clients/model/company_list_model.dart';
import 'package:crm_demo/utils/app_const.dart' show AppConst;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../utils/nav_utail.dart';
import '../crm_clinet_repository/client_repository.dart';

class AddClientProvider extends ChangeNotifier {
  AddClientProvider() {
    getCompanyList();
  }

  final clientNameController = TextEditingController();
  final clientPhoneNumberController = TextEditingController();
  final clientEmailController = TextEditingController();
  final clientPasswordController = TextEditingController();
  final clientAddressController = TextEditingController();
  final clientDescriptionController = TextEditingController();

  File? imagePath;
  CompanyData? companyData;
  CompanyListModel companyListModel = CompanyListModel();

  Future addClient(BuildContext context, bool isUpdate, String userId) async {
    if (companyData == null) {
      Fluttertoast.showToast(msg: 'Select your Company');
      return;
    }

    final data = {
      "request": isUpdate ? "updateUser" : "createNewUser",
      "header": AppConst.header,
      "data":
          isUpdate
              ? {
                'userid': int.parse(userId),
                "conpany_id": int.parse(companyData?.companyId ?? '0'),
                "user_name": clientNameController.text,
                "email_id": clientEmailController.text,
                "mobile": clientPhoneNumberController.text,
                "password": clientPasswordController.text,
                "address": clientAddressController.text,
              }
              : {
                "conpany_id": int.parse(companyData?.companyId ?? '0'),
                "user_name": clientNameController.text,
                "email_id": clientEmailController.text,
                "mobile": clientPhoneNumberController.text,
                "password": clientPasswordController.text,
                "address": clientAddressController.text,
              },
    };

    final response = await CrmClientRepository.addClient(
      data,
      endPoints: isUpdate ? '/Welcome/updateUser' : '/Welcome/createNewUser',
    );

    if (response['status'] == true) {
      NavUtil.pushAndRemoveUntil(context, const CrmHomeScreen());
      notifyListeners();
    }
  }

  selectCompany(CompanyData? value) {
    companyData = value;
    notifyListeners();
  }

  // isUpdateFun(bool value) {
  //   isUpdate = value;
  //   notifyListeners();
  // }

  Future getCompanyList() async {
    final response = await CrmClientRepository.getCompanyList();
    if (response['status'] == true) {
      companyListModel = CompanyListModel.fromJson(response);
      notifyListeners();
    }
  }

  ///Pick image from Camera and Gallery
  Future<dynamic> pickImage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogImagePicker(
          onCameraClick: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(
              source: ImageSource.camera,
              maxHeight: 300.h,
              maxWidth: 300.w,
              imageQuality: 90,
            );
            imagePath = File(image!.path);
            notifyListeners();
            if (kDebugMode) {
              print(File(image.path));
            }
          },
          onGalleryClick: () async {
            final ImagePicker pickerGallery = ImagePicker();
            final XFile? imageGallery = await pickerGallery.pickImage(
              source: ImageSource.gallery,
              maxHeight: 300.h,
              maxWidth: 300.w,
              imageQuality: 90,
            );
            imagePath = File(imageGallery!.path);
            if (kDebugMode) {
              print(File(imageGallery.path));
            }
            notifyListeners();
          },
        );
      },
    );
    notifyListeners();
  }
}
