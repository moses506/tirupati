import 'package:flutter/material.dart';
import 'package:crm_demo/screens/appFlow/menu/mailbox/provider/mailbox_provider.dart';
import 'package:provider/provider.dart';

class DraftList extends StatelessWidget {

  const DraftList({super.key, });
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => MailBoxProvider("draft"),
      child: Consumer<MailBoxProvider>(
          builder: (context, provider, _) {
            final draftList = provider.mailInboxListResponse?.data?.mailbox;
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
                              const Text("Draft", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              Text("Total : ${draftList?.length ?? ''}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(height: 14,),
                          Container(width: MediaQuery.of(context).size.width, height: 1, color: Colors.grey,),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: draftList?.length ?? 0,
                              itemBuilder: (BuildContext context, int index){
                                final data = draftList?[index];
                                return InkWell(
                                  onTap: (){},
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
                                              children: [
                                                Text("Sender: ${data?.sender ?? ''}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),),
                                                Text("Subject: ${data?.subject ?? ''}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),),
                                                Text("Date: ${data?.createdAt ?? ''}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),),
                                              ],
                                            ),
                                          ),
                                        ],),],),
                                );}),
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
}
