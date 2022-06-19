import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testx/Authenticate/login_sceen1.dart';


import 'firebase_options.dart';

// wrapper.dart,sign_in.dart,authenticate.dart are all useless, dont consider them
// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
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
