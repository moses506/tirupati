import 'package:flutter/material.dart';
import 'package:crm_demo/screens/appFlow/menu/new_clients_details/provider/client_reminder_provider.dart';
import 'package:crm_demo/screens/appFlow/menu/sales/product/content/new_form_field.dart';
import 'package:crm_demo/screens/custom_widgets/custom_list_shimer.dart';
import 'package:crm_demo/screens/custom_widgets/no_data_found_widget.dart';
import 'package:crm_demo/utils/res.dart';
import 'package:provider/provider.dart';


class ClientReminderList extends StatelessWidget {
  int clientId;
  ClientReminderList({super.key, required this.clientId});

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientReminderProvider>(
        builder: (context, provider, _) {
          final reminderList = provider.clientReminderListResponse?.data?.data;
          return SingleChildScrollView(
              child:  Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Reminder List", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        InkWell(
                          onTap: ()=> createClientReminder(context, provider, clientId ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(color: const Color(0xff5B58FF), borderRadius: BorderRadius.circular(8)),
                            child: const Row(
                              children: [
                                Icon(Icons.add, size: 14, color: Colors.white,),
                                Text("Create", style: TextStyle(color: Colors.white, fontSize: 12),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric( horizontal: 12),
                    child:
                        provider.isLoading  ? const CustomListShimer() :
                        reminderList?.isNotEmpty == true ?
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: reminderList?.length ?? 0,
                        itemBuilder: (BuildContext context, int index){
                          final data = reminderList?[index];
                          return InkWell(
                                   onTap: (){},
                                   child: Card(
                                   margin: const EdgeInsets.only(bottom: 10),
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                                    color: Colors.white,
                                    child: Padding(
                                    padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 12),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Expanded(
                                        flex : 2,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Reminder Date", style:  TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),),
                                            Text("Description", style:  TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),),
                                            Text("Remind To", style:  TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(": ${data?.date ?? ""}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.colorPrimary),),
                                            Text(": ${data?.description ?? ""}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.colorPrimary),),
                                            Text(": ${data?.client?.name ?? ""}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.colorPrimary),),
                                          ],
                                        ),
                                      ),],),
                                ],),
                            ),
                          ));}) : const NoDataFoundWidget(),
                  ),
                ],
              )
          );
        }
    );
  }



  void createClientReminder(BuildContext parentContext, ClientReminderProvider provider, int clientId) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return ChangeNotifierProvider.value(
          value: provider,
          child: Builder(
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(12.0),
                  child: Consumer<ClientReminderProvider>(
                    builder: (_, provider, __) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(height: 5),
                            const Text(
                              "Add Reminder",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            NewTextField(
                              labelText: "Description",
                              maxLine: 3,
                              controller: provider.descriptionController,
                            ),
                            const SizedBox(height: 8),
                            InkWell(
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
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (provider.descriptionController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Description is required."),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  } else if (provider.monthYear == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Date is required."),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                  else {
                                    provider.createClientReminder(context, clientId);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff5B58FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  minimumSize: const Size(double.infinity, 50),
                                ),
                                child: const Text(
                                  "Create",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

}
