import 'package:flutter/material.dart';
import 'package:crm_demo/data/model/campaign/campaign_list_model.dart';
import 'package:crm_demo/data/server/respository/crm_booking_repository/crm_booking_repository.dart';

class CampaignListProvider extends ChangeNotifier{

  CampaignListModel? campaignListResponse;

  bool isLoading = false;

  CampaignListProvider(){
    getCampaignList();
  }

  getCampaignList() async {
    isLoading = true;
    final response = await CrmBookingRepository.getCampaignListData();
    if(response.result == true){
      campaignListResponse = response.data;
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

}