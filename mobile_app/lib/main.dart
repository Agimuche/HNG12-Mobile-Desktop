import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Uri _githubRepo = Uri.parse('https://github.com/YOUR_USERNAME/HNG12-Mobile-Desktop');
  final Uri _hngHire = Uri.parse('https://hng.tech/hire');

  const HomeScreen({super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HNG12 Mobile App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to HNG12 Mobile App",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchUrl(_githubRepo),
              child: Text("View GitHub Repository"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchUrl(_hngHire),
              child: Text("Visit HNG Hire Page"),
            ),
          ],
        ),
      ),
    );
  }
}
