import 'package:flutter/material.dart';
import 'package:project_spa_v3/enterpage.dart';
import 'package:project_spa_v3/aboutpage.dart';
import 'package:project_spa_v3/newspage.dart';
import 'package:project_spa_v3/projectspage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as fb_core;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await fb_core.Firebase.initializeApp(
    options: fb_core.FirebaseOptions(
      apiKey: const String.fromEnvironment('API_KEY'),
      authDomain: const String.fromEnvironment('AUTH_DOMAIN'),
      projectId: const String.fromEnvironment('PROJECT_ID'),
      storageBucket: const String.fromEnvironment('STORAGE_BUCKET'),
      messagingSenderId: const String.fromEnvironment('MESSAGING_SENDER_ID'),
      appId: const String.fromEnvironment('APP_ID'),
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
    return ScreenUtilInit(
        designSize: const Size(960, 1040),
        builder: (context, child) {
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
        });
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
