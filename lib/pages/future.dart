import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'listItem.dart';

class FuturePage extends StatelessWidget {
  //const FuturePage({Key? key}) : super(key: key);

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
                      isGreaterThan: Timestamp.fromDate(DateTime.now()))
                  .get();
              return toRtnSnapshot;
            }),
            builder: (context, AsyncSnapshot snapshot) {
              List<Widget> currentAuctionItems = [];
              if (snapshot.hasData) {
                snapshot.data!.docs.forEach((value) => {
                      currentAuctionItems.add(ListItemWidget(
                          id: value.id,
                          title: value["title"],
                          bidPrice: value["bidPrice"],
                          sellerEmail: value["seller"],
                          description: value["description"],
                          imageURL: value["imageURL"],
                          date: value["timestamp"].toDate().toLocal(),
                          bidderEmail: value["bidder"]))
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
