import 'package:flutter/material.dart';
import 'package:crm_demo/data/model/discount/discount_list_model.dart';
import 'package:crm_demo/data/server/respository/crm_booking_repository/crm_booking_repository.dart';

class DiscountListProvider extends ChangeNotifier{

  DiscountListModel? discountListResponse;
  bool isLoading = false;

  DiscountListProvider(){
    getDiscountList();
  }


  getDiscountList() async {
    isLoading = true;
    final response = await CrmBookingRepository.getDiscountListData();
    if(response.result == true){
      discountListResponse = response.data;
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

}