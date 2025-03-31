
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:crm_demo/api_service/estimate_order_service.dart';
import 'package:crm_demo/api_service/proposal_order_service.dart';
import 'package:crm_demo/data/model/client_estimate/estimateOrderCart.dart';
import 'package:crm_demo/data/model/client_invoice/client_invoice_product_list.dart';
import 'package:crm_demo/data/model/client_invoice/client_invoice_warehouse_list_model.dart';
import 'package:crm_demo/data/model/client_proposal/proposalOrderCart.dart';
import 'package:crm_demo/screens/appFlow/menu/clients/crm_clinet_repository/client_repository.dart';
import 'package:crm_demo/screens/appFlow/menu/new_clients_details/event/estimate_events.dart';
import 'package:crm_demo/screens/appFlow/menu/new_clients_details/provider/client_estimate_list_provider.dart';
import 'package:crm_demo/screens/appFlow/menu/new_clients_details/provider/client_proposal_list_provider.dart';
import 'package:crm_demo/utils/event_bus.dart';
import 'package:provider/provider.dart';

class ClientCreateEstimateProvider extends ChangeNotifier{

  final discountController = TextEditingController();
  final noteController = TextEditingController();

  ClientInvoiceWarehouseListModel? clientInvoiceWarehouseListResponse;
  ClientInvoiceProductListModel? clientInvoiceProductListResponse;

  ClientInvoiceWarehouse? clientInvoiceWarehouse;
  ClientInvoiceProduct? clientInvoiceProduct;

  String? monthYear;
  DateTime? selectedDate;

  bool isChecked = false;

  bool isLoading = false;


  ClientCreateEstimateProvider(){
    getClientInvoiceWarehouseList();
  }


  /// select warehouse and call product list based on selected warehouse
  Future<void> selectWarehouse(ClientInvoiceWarehouse clientInvoiceWarehouseValue) async {
    clientInvoiceWarehouse = clientInvoiceWarehouseValue;
    isLoading = true;
    notifyListeners();
    try {
      await getClientInvoiceProductList(clientInvoiceWarehouse?.id ?? 0);
      clientInvoiceProduct = null;
    } catch (error) {
      Fluttertoast.showToast(toastLength: Toast.LENGTH_LONG, msg: "Something went wrong");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  getClientInvoiceWarehouseList() async {
    final response = await CrmClientRepository.getClientInvoiceWarehouseListData();
    if(response.result == true){
      clientInvoiceWarehouseListResponse = response.data;
      notifyListeners();
    }
    notifyListeners();
  }



  getClientInvoiceProductList(int wareHouseId) async {
    isLoading = true;
    final response = await CrmClientRepository.getClientInvoiceProductListData(wareHouseId);
    if(response.result == true){
      clientInvoiceProductListResponse = response.data;
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }



  void toggleCheckbox(bool value) {
    isChecked = value;
    notifyListeners();
  }

  Future selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: DateTime.now(),
      locale: const Locale("en"),
    ).then((date) {
      if (date != null) {
        selectedDate = date;
        monthYear = DateFormat('yyyy-MM-dd').format(selectedDate!);
        if (kDebugMode) {
          print(DateFormat('yyyy-MM-dd').format(selectedDate!));
        }
        notifyListeners();
      }
    });
  }



  ///create estimate
  Future<void> createClientEstimate(BuildContext context, int clientId, List<EstimateOrderCart> cartItems, int wareHouseId) async {


    List<Map<String, dynamic>> items = cartItems.map((item) {
      return {
        "product_id": item.id,
        "qty": item.quantity,
        "net_unit_cost": item.netUnitCost?.toDouble() ?? 0.0,
        "recieved": item.received ?? 0,
        "batch_no": item.batchNo ?? "",
        "expired_date":  "",
        "discount": item.discount ?? 0,
        "imei_number": item.imeiNumber ?? ""
      };
    }).toList();

    final data = FormData.fromMap({
      "type": "estimate",
      "warehouse_id": wareHouseId,
      "client_id": clientId,
      "order_discount": int.tryParse(discountController.text),
      "shipping_cost": 0,
      "paid_amount": 0,
      "note": noteController.text,
      "items": items,
    });

    final response = await CrmClientRepository.createClientEstimate(data);
    if(response.httpCode == 200){
      Fluttertoast.showToast(toastLength: Toast.LENGTH_LONG, msg: response.message);
      Navigator.pop(context);
      Navigator.pop(context);
      eventBus.fire(EstimateCartClearedEvent());
      eventBus.fire(EstimateCreatedEvent(clientId));
      discountController.clear();
      noteController.clear();
      items = [];
    } else if(response.httpCode == 422){
      Fluttertoast.showToast(toastLength: Toast.LENGTH_LONG, msg: response.message);
    } else if(response.httpCode == 400){
      Fluttertoast.showToast(toastLength: Toast.LENGTH_LONG, msg: response.message);
    }
    else {
      Fluttertoast.showToast(toastLength: Toast.LENGTH_LONG, msg: 'Something went wrong');
    }
    notifyListeners();

  }



}