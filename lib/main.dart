import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tambahkan MaterialApp sebagai root widget
      home: LauncherApp(),
    );
  }
}

class LauncherApp extends StatefulWidget {
  @override
  _LauncherAppState createState() => _LauncherAppState();
}

class _LauncherAppState extends State<LauncherApp> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Indeks halaman aktif

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Launcher App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                // Halaman 1
                Center(
                  child: Text('Halaman 1'),
                ),
                // Halaman 2
                Center(
                  child: Text('Halaman 2'),
                ),
                // Halaman 3
                Center(
                  child: Text('Halaman 3'),
                ),
              ],
            ),
          ),
          DotsIndicator(
            dotsCount: 3, // Jumlah total halaman
            position: _currentPage,
            decorator: DotsDecorator(
              size: Size(10.0, 10.0), // Ukuran bulatan
              color: Colors.grey, // Warna bulatan non-aktif
              activeSize: Size(20.0, 10.0), // Ukuran bulatan aktif
              activeColor: Colors.blue, // Warna bulatan aktif
            ),
          ),
        ],
      ),
    );
  }
}
