import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/app_config.dart';
import 'config/dependency_injector.dart';
import 'screens/home_screen.dart';

/// Entry point aplikasi.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Muat file .env
  await dotenv.load(fileName: ".env");

  // Periksa konfigurasi
  if (!AppConfig.isConfigured()) {
    debugPrint('⚠️ Konfigurasi .env tidak lengkap. Periksa file .env Anda.');
  }

  // Inisialisasi Dependency Injector
  final dependencyInjector = DependencyInjector();

  runApp(MyApp(dependencyInjector: dependencyInjector));
}

class MyApp extends StatelessWidget {
  final DependencyInjector dependencyInjector;

  const MyApp({super.key, required this.dependencyInjector});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPL & Keamanan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
