import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'listItem.dart';

class PresentPage extends StatelessWidget {
  // const PresentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: StreamBuilder(
            stream:
                Stream.periodic(Duration(seconds: 5)).asyncMap((event) async {
              QuerySnapshot toRtnSnapshot = await FirebaseFirestore.instance
                  .collection('auction_items')
                  .orderBy("timestamp", descending: false)
                  .where("timestamp",
                      isLessThan: Timestamp.fromDate(DateTime.now()),
                      isGreaterThan: Timestamp.fromDate(
                          DateTime.now().subtract(Duration(minutes: 30))))
                  .get();
              return toRtnSnapshot;
            }),
            builder: (context, AsyncSnapshot snapshot) {
              List<Widget> currentAuctionItems = [];
              if (snapshot.hasData) {
                print(snapshot.data!);
                snapshot.data!.docs.forEach((value) => {
                      currentAuctionItems.add(ListItemWidget(
                        id: value.id,
                        title: value["title"],
                        sellerEmail: value["seller"],
                        bidPrice: value["bidPrice"],
                        description: value["description"],
                        imageURL: value["imageURL"],
                        date: value["timestamp"].toDate().toLocal(),
                        bidderEmail: value["bidder"],
                      ))
                    });
                return currentAuctionItems.length > 0
                    ? ListView(
                        children: currentAuctionItems,
                      )
                    : Center(
                        child: Text("No Items"),
                      );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      );
}
