import 'package:flutter/material.dart';
import 'dart:html' as html; // For web-specific APIs

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String apkUrl = 'https://yourserver.com/app-release.apk';
  final String heroImageUrl =
      'https://superbcompanies.s3.eu-central-1.amazonaws.com/images/companies/logos/8d7cda80-61b8-11ed-b2a5-a9129be4f41e.png'; // or host image

  void _onDownloadPressed() {
    final anchor =
        html.AnchorElement(href: apkUrl)
          ..setAttribute('download', '')
          ..target = '_blank';
    html.document.body?.append(anchor);
    anchor.click();
    anchor.remove();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Row(
            children: [
              // Left side: text & button
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('SAMAPRK', style: theme.textTheme.displayLarge),
                    const SizedBox(height: 16),
                    Text(
                      'The Best App For Connecting with Your Friends.',
                      style: theme.textTheme.displayMedium,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'You can track all your transaction expenses and incomes with the helping of this app, '
                      'this app is specially made for students and large group member management.',
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      onPressed: _onDownloadPressed,
                      icon: const Icon(Icons.download),
                      label: const Text('Download App'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                        backgroundColor: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 32),

              // Right side: hero image
              Expanded(
                flex: 5,
                child: ClipRRect(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
