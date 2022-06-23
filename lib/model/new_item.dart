import 'package:flutter/material.dart';

class AuctionPageModel {
  final String id;
  final String title;
  final String description;
  final String imageURL;
  final String sellerEmail;
  final DateTime date;
  // final TimeOfDay selectedtime;
  String bidderEmail;
  var bidPrice;
  AuctionPageModel(
      {Key? key,
      required this.id,
      required this.title,
      required this.sellerEmail,
      required this.description,
      required this.imageURL,
      required this.date,
      //  required this.selectedtime,
      required this.bidderEmail,
      required this.bidPrice});
}
