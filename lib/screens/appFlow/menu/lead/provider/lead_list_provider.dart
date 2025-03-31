
import 'package:flutter/material.dart';
import 'package:crm_demo/data/model/lead/lead_list_model.dart';
import 'package:crm_demo/data/server/respository/crm_sales_repository/crm_sales_repository.dart';

class LeadListProvider extends ChangeNotifier{

  LeadListModel? leadListResponse;

  bool isLoading  = false;

  LeadListProvider(){
    getLeadList();
  }


  getLeadList() async {
    isLoading =  true;
    final response = await CRMSalesRepository.getLeadListData();
    if(response.result == true){
      leadListResponse = response.data;
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

}