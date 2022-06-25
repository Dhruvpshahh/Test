import 'package:flutter/material.dart';
import 'package:testx/model/new_item.dart';
import 'package:testx/pages/AuctionPage.dart';

class ListItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String imageURL;
  final String sellerEmail;
  final DateTime date;
  final String bidderEmail;
  final bidPrice;

  const ListItemWidget(
      {Key? key,
      required this.id,
      required this.title,
      required this.sellerEmail,
      required this.description,
      required this.imageURL,
      required this.date,
      required this.bidPrice,
      required this.bidderEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainAuctionPage(auctionModel: AuctionPageModel(id: id, title: title, sellerEmail: sellerEmail, description: description, imageURL: imageURL, date: date, bidderEmail: bidderEmail, bidPrice: bidPrice))));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(21)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 194),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 105, maxWidth: 135),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(21),
                    bottomRight: Radius.circular(21)),
                child: Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.35,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imageURL), fit: BoxFit.cover)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
