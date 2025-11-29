import 'dart:html' as html;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sampark Download',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        primaryColor: Colors.blueAccent,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ✅ YOUR FIREBASE APK DIRECT DOWNLOAD LINK
final String apkUrl = 'https://github.com/JainamO7/webapp/releases/download/1.0.0/app-release.apk';

  final String heroImageUrl =
      'https://superbcompanies.s3.eu-central-1.amazonaws.com/images/companies/logos/8d7cda80-61b8-11ed-b2a5-a9129be4f41e.png';

void _onDownloadPressed() {
  final anchor = html.AnchorElement(href: apkUrl)
    ..setAttribute('download', 'hightech.apk')
    ..target = '_blank';
  html.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
            ],
          ),
        ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTextSection(theme),
                      const SizedBox(height: 32),
                      _buildImageSection(),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      Expanded(flex: 5, child: _buildTextSection(theme)),
                      const SizedBox(width: 32),
                      Expanded(flex: 5, child: _buildImageSection()),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'SAMAPRK',
          style:
              theme.textTheme.displayLarge ??
              const TextStyle(fontSize: 36, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          'The Best App For Connecting with Your Friends.',
          style:
              theme.textTheme.displayMedium ??
              const TextStyle(fontSize: 24, color: Colors.white70),
        ),
        const SizedBox(height: 24),
        Text(
          'You can track all your transaction expenses and incomes with the helping of this app, '
          'this app is specially made for students and large group member management.',
          style:
              theme.textTheme.bodyLarge ??
              const TextStyle(fontSize: 16, color: Colors.white60),
        ),
        const SizedBox(height: 32),
        ElevatedButton.icon(
          onPressed: _onDownloadPressed,
          icon: const Icon(Icons.download),
          label: const Text('Download App'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(fontSize: 18),
            backgroundColor: Colors.blueAccent,
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        heroImageUrl,
        fit: BoxFit.cover,
        errorBuilder:
            (c, e, s) => const SizedBox(
              height: 200,
              child: Center(child: Text('Image load error')),
            ),
      ),
    );
  }
}
