import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://opqcbadvthtnpbnkqshk.supabase.co', // <-- Замени на свой
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9wcWNiYWR2dGh0bnBibmtxc2hrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4MTU5MTcsImV4cCI6MjA1ODM5MTkxN30.EKVp9smgEXMvdzsXSvxc_qPUKm2_H8mUIxaFg3W7UT4',               // <-- Замени на свой
  );

  runApp(const HydrochemistryApp());
}

class HydrochemistryApp extends StatelessWidget {
  const HydrochemistryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydrochemistry App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru'),
        Locale('kk'),
      ],
      locale: const Locale('ru'), // Можно поменять на Locale('kk')
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/logo_lab.png', height: 40),
            Text(loc.appTitle, style: const TextStyle(fontSize: 16)),
            Image.asset('assets/logo_kz.png', height: 40),
          ],
        ),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          loc.welcomeText,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blueAccent),
            child: Text(
              loc.navigation,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(loc.home),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: Text(loc.history),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: Text(loc.admin),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: Text(loc.staff),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: Text(loc.projects),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: Text(loc.contacts),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
