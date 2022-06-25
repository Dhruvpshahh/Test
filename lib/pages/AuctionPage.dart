import 'package:flutter/material.dart';
import 'package:testx/model/new_item.dart';

class MainAuctionPage extends StatefulWidget {
  const MainAuctionPage({Key? key, required AuctionPageModel auctionModel}) : super(key: key);

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
      body: Container(
      width: _width,
    height: _height,
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child:new Padding(padding: const EdgeInsets.all(20.0),
                child:Center(
                  child: Text(
                    'Title',
                  ),
                ),
              )
            ),
        ],
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
                child:new Padding(padding: const EdgeInsets.all(20.0),
                  child:Center(
                    child: Text(
                      'Seller Email: xyz@gmail.com',
                    ),
                  ),
                )
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ConstrainedBox(
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
                            image: NetworkImage('https://images.unsplash.com/photo-1542840843-3349799cded6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c21hbGwlMjBzaXplfGVufDB8fDB8fA%3D%3D&w=1000&q=80'), fit: BoxFit.cover)),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ),
      ),
    );
  }
}
