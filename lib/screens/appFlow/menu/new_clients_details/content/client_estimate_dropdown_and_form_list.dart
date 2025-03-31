import 'package:flutter/material.dart';
import 'package:crm_demo/api_service/estimate_order_service.dart';
import 'package:crm_demo/data/model/client_invoice/client_invoice_warehouse_list_model.dart';
import 'package:crm_demo/screens/appFlow/menu/new_clients_details/provider/client_create_estimate_provider.dart';
import 'package:crm_demo/screens/appFlow/menu/sales/product/content/custom_dropdown.dart';
import 'package:provider/provider.dart';

class ClientEstimateDropDownAndFormList extends StatelessWidget {
  final ClientCreateEstimateProvider provider;

  const ClientEstimateDropDownAndFormList({
    super.key, required this.provider
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 8,),
          Row(
            children: [
              Expanded(child:  InkWell(
                onTap: () => provider.selectDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                  margin: const EdgeInsets.symmetric( horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( provider.monthYear ??  "Select Date",style: const  TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                      const Icon(Icons.calendar_month_outlined, color: Colors.grey,)
                    ],
                  ),
                ),
              ),),
              Consumer<EstimateOrderService>(
                  builder: (context, estimateCartProvider, _) {
                    return Expanded(
                      child: CustomDropdown<ClientInvoiceWarehouse>(
                        value: provider.clientInvoiceWarehouse,
                        labelText: 'Select warehouse',
                        items: provider.clientInvoiceWarehouseListResponse?.data ?? [],
                        onChanged: (ClientInvoiceWarehouse? newValue) {
                          provider.selectWarehouse(newValue!);
                          estimateCartProvider.clearProductFromCart();
                        },
                        itemLabelBuilder: (ClientInvoiceWarehouse value) => value.name ?? '',
                      ),
                    );
                  }
              ),
            ],
          ),
        ],
      ),
    );
  }
}