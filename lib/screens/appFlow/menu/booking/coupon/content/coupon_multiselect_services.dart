import 'package:flutter/material.dart';
import 'package:crm_demo/data/model/discount/discount_create_component_list_model.dart';
import 'package:crm_demo/screens/appFlow/menu/booking/coupon/provider/create_coupon_provider.dart';


class CouponMultiselectService extends StatelessWidget {
  CreateCouponProvider provider;
  CouponMultiselectService({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              showServiceMultiSelectDialog(context, provider.discountComponentListResponse?.data?.services ?? [], provider);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Service',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ),
        const SizedBox( height: 6,),
        provider.selectedCouponServices.isNotEmpty ?
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            "Selected Services:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ) : const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            provider.selectedCouponServices.map((e) => e.name).join(", "),
          ),
        ),
      ],
    );
  }

  void showServiceMultiSelectDialog(BuildContext context, List<DiscountComponent> items, CreateCouponProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Text("Select Service") ,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                width: double.maxFinite,
                child: ListView(
                  children: items.map((service) {
                    return CheckboxListTile(
                      title: Text(service.name!),
                      value: provider.selectedCouponServices.any((selected) => selected.id == service.id),
                      onChanged: (bool? value) {
                        provider.toggleService(service);
                        setState(() {});
                      },
                    );
                  }).toList(),
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
