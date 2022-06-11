import 'package:flutter/material.dart';
import 'package:testx/Screens/wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: wrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _selectedIndex = 0;
//   final screens = [
//     PresentPage(),
//     FuturePage(),
//     PastPage(),
//   ];
//   // static const TextStyle optionStyle =
//   //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   // static const List<Widget> _widgetOptions = <Widget>[
//   //   Text(
//   //     'Present',
//   //     style: optionStyle,
//   //   ),
//   //   Text(
//   //     'Future',
//   //     style: optionStyle,
//   //   ),
//   //   Text(
//   //     'Past',
//   //     style: optionStyle,
//   //   ),
//   // ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Auctioneer'),
//       ),
//       body: screens[_selectedIndex],
//       // body: Center(
//       //   child: _widgetOptions.elementAt(_selectedIndex),
//       // ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.blue,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add),
//             label: 'Present',
//             // backgroundColor: Colors.blueGrey,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add),
//             label: 'Future',
//             // backgroundColor: Colors.red,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add),
//             label: 'Past',
//             //backgroundColor: Colors.teal,
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white54,
//         iconSize: 37,
//         selectedFontSize: 15,
//         unselectedFontSize: 12,
//         //showSelectedLabels: false,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
