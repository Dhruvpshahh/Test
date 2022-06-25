import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testx/model/new_item.dart';

class MainAuctionPage extends StatefulWidget {
  AuctionPageModel auctionModel;
  MainAuctionPage({Key? key, required this.auctionModel}) : super(key: key);

  @override
  State<MainAuctionPage> createState() => _MainAuctionPageState();
}

class _MainAuctionPageState extends State<MainAuctionPage> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Auction Page'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("auction_items")
            .doc(widget.auctionModel.id)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            widget.auctionModel.bidPrice = snapshot.data!["bidPrice"];

            return Container(
              width: _width,
              height: _height,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: new Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            widget.auctionModel.title,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: new Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            "Seller Email: " + widget.auctionModel.sellerEmail,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 205),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              width: screenWidth * 0.90,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.auctionModel.imageURL),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            "Start Time: ${DateFormat.yMMMd().add_jm().format(snapshot.data!["timestamp"].toDate().toLocal())}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                            child: Visibility(
                          visible: widget.auctionModel.date
                                      .isBefore(DateTime.now()) &&
                                  widget.auctionModel.date
                                      .add(Duration(minutes: 30))
                                      .isAfter(DateTime.now())
                              ? true
                              : false,
                          child: Text((snapshot.data!["bidder"] == ""
                              ? "No Bids yet"
                              : "bidder email : " + snapshot.data!["bidder"])),
                        )),
                      )),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
