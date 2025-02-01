import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HNG Hyperlink',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'HNG Hyperlink'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Links to various hyperlinks',
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () =>
                  _launchURL('https://github.com/ClementPeter/hng_link_app'),
              child: const Text('GitHub Repo'),
            ),
            ElevatedButton(
              onPressed: () =>
                  _launchURL('https://hng.tech/hire/flutter-developers'),
              child: const Text('Hire Flutter Developers'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://telex.im/'),
              child: const Text('Telex IM'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://delve.fun/'),
              child: const Text('Delve Fun'),
            ),
          ],
        ),
      ),
    );
  }
}
