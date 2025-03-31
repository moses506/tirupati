import 'package:flutter/material.dart';
import 'package:crm_demo/data/model/discount/discount_create_component_list_model.dart';
import 'package:crm_demo/screens/appFlow/menu/booking/campaign/provider/create_campaign_provider.dart';

class CampaignMultiselectCategories extends StatelessWidget {
  CreateCampaignProvider provider;
  CampaignMultiselectCategories({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              showCategoryMultiSelectDialog(context, provider.campaignComponentListResponse?.data?.serviceCategories ?? [], provider);
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
                    'Select Category',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ),
        const SizedBox( height: 6,),
        provider.selectedCampaignCategories.isNotEmpty ?
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            "Selected Categories:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ) : const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            provider.selectedCampaignCategories.map((e) => e.name).join(", "),
          ),
        ),
      ],
    );
  }

  void showCategoryMultiSelectDialog(BuildContext context, List<DiscountComponent> items, CreateCampaignProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Text("Select Category") ,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                width: double.maxFinite,
                child: ListView(
                  children: items.map((category) {
                    return CheckboxListTile(
                      title: Text(category.name!),
                      value: provider.selectedCampaignCategories.any((selected) => selected.id == category.id),
                      onChanged: (bool? value) {
                        provider.toggleCategory(category);
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
