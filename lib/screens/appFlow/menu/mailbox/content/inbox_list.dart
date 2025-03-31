import 'package:flutter/material.dart';
import 'package:crm_demo/screens/appFlow/menu/mailbox/provider/mailbox_provider.dart';
import 'package:crm_demo/screens/appFlow/menu/mailbox/view/mail_details_screen.dart';
import 'package:crm_demo/screens/custom_widgets/no_data_found_widget.dart';
import 'package:crm_demo/utils/nav_utail.dart';
import 'package:provider/provider.dart';

class InboxList extends StatelessWidget {

  const InboxList({super.key, });
  @override
  Widget build(BuildContext context) {
  
    return ChangeNotifierProvider(
      create: (_) => MailBoxProvider(""),
      child: Consumer<MailBoxProvider>(
        builder: (context, provider, _) {
          final inboxList = provider.mailInboxListResponse?.data?.mailbox;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Inbox", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            Text("Total : ${inboxList?.length ?? ""}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 14,),
                        Container(width: MediaQuery.of(context).size.width, height: 1, color: Colors.grey,),
                        inboxList?.isNotEmpty == true ?
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: inboxList?.length ?? 0,
                            itemBuilder: (BuildContext context, int index){
                              final data = inboxList?[index];
                              return InkWell(
                                onTap: (){
                                   NavUtil.navigateScreen(context, MailDetailsScreen(mailBoxId: data?.id ?? 0,));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 14,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Sender: ${data?.sender ?? ''}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),),
                                              Text("Date: ${data?.createdAt ?? ''}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text("Subject : ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),),
                                                  data?.childrenCount != 0 ? const Icon(Icons.reply, color: Colors.grey, size: 12,) : const SizedBox(),
                                                  data?.childrenCount != 0 ?   Text(" (${data?.childrenCount.toString() ?? ""}) ", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),)  : const SizedBox(),
                                                  Expanded(child: Text(data?.subject ?? '', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        InkWell(
                                            onTap : (){
                                              provider.updateStatus(context, "", [data?.id ?? 0], 'starred', data?.isStarred == 0 ? 1 : 0 );
                                            },
                                            child: data?.isStarred == 1
                                            ? const Icon(Icons.star, size: 18, color: Colors.amber,)
                                            : const Icon(Icons.star_border_outlined, size: 18, color: Colors.amber,)),

                                        const SizedBox(width: 08,),
                                        InkWell(
                                            onTap : (){
                                              provider.updateStatus(context, "", [data?.id ?? 0], 'important', data?.isImportant == 0 ? 1 : 0 );
                                            },
                                            child: data?.isImportant == 1
                                                ? const Icon(Icons.bookmark, size: 18, color: Colors.black,)
                                                : const Icon(Icons.bookmark_border, size: 18, color: Colors.black,)),
                                        const SizedBox(width: 08,),
                                        InkWell(
                                            onTap: (){
                                              showDeleteConfirmationDialog(context, () {
                                                provider.moveToTrash(context, "", [data?.id ?? 0]);
                                              });
                                            },
                                            child: const Icon(Icons.delete_outline, size: 18,)),
                                      ],),],),
                              );}) : const NoDataFoundWidget(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  void showDeleteConfirmationDialog(BuildContext context, Function onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Confirmation'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                onConfirm(); // Call the confirmation action
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }


}
