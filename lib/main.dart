import 'package:flutter/material.dart';
import 'package:project_spa_v3/enterpage.dart';
import 'package:project_spa_v3/aboutpage.dart';
import 'package:project_spa_v3/newspage.dart';
import 'package:project_spa_v3/projectspage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as fb_core;
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await fb_core.Firebase.initializeApp(
    options: fb_core.FirebaseOptions(
      apiKey: dotenv.env['API_KEY']!,
      authDomain: dotenv.env['AUTH_DOMAIN']!,
      projectId: dotenv.env['PROJECT_ID']!,
      storageBucket: dotenv.env['STORAGE_BUCKET']!,
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
      appId: dotenv.env['APP_ID']!,
    ),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static final storage = firebase_storage.FirebaseStorage.instance;
  static final storageRef = storage.ref();

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andrei Blokhin',
      theme: ThemeData(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return _buildPageRoute(EnterPage());
          case '/home':
            return _buildPageRoute(AboutPage());
          case '/news':
            return _buildPageRoute(NewsPage());
          case '/projects':
            return _buildPageRoute(ProjectsPage());
          case '/about':
            return _buildPageRoute(AboutPage());
          default:
            return _buildPageRoute(EnterPage());
        }
      },
    );
  }

  PageRouteBuilder _buildPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
