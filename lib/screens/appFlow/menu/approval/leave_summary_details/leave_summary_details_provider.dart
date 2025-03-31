import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crm_demo/api_service/api_body.dart';
import 'package:crm_demo/data/model/response_all_leave_request_details.dart';
import 'package:crm_demo/data/server/respository/repository.dart';
import 'package:crm_demo/utils/shared_preferences.dart';
import '../../../../../data/model/home/crm_home_model.dart';

class LeaveSummaryDetailsProvider extends ChangeNotifier{
  ResponseLeaveRequestDetails? leaveDetails;
  Members? allUserData;

  late TextEditingController updateNoteController;

  String? attachment;
  File? attachmentPath;
  LeaveSummaryDetailsProvider(int? leaveRequestDetailsId,int? userID){
    leaveRequestDetails(leaveRequestDetailsId,userID);
  }

  Future leaveRequestDetails(requestId,userID) async {
    var userIdKey = await SPUtill.getIntValue(SPUtill.keyUserId);
    var userId = userID ?? userIdKey;
    var bodyUserId = BodyUserId(userId: userId);
    var apiResponse =
    await Repository.leaveRequestDetails(bodyUserId, requestId);
    if (apiResponse.result == true) {
      leaveDetails = apiResponse.data;
      updateNoteController = TextEditingController(text: leaveDetails?.data?.note);
      attachment = leaveDetails?.data?.attachment;
      notifyListeners();
    } else {
      if (kDebugMode) {
        print(apiResponse.data?.message);
      }
    }
  }
}