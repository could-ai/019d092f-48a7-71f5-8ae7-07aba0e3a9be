import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/event.dart';
import 'models/news.dart';
import 'models/user.dart';
import 'providers/app_provider.dart';
import 'screens/home_screen.dart';
import 'screens/events_screen.dart';
import 'screens/news_screen.dart';
import 'screens/add_event_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: const WhanganuiHubApp(),
    ),
  );
}

class WhanganuiHubApp extends StatelessWidget {
  const WhanganuiHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whanganui Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/events': (context) => const EventsScreen(),
        '/news': (context) => const NewsScreen(),
        '/add-event': (context) => const AddEventScreen(),
      },
    );
  }
}
