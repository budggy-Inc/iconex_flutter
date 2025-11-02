import 'package:example/src/icon_catalog.dart';
import 'package:example/src/icon_grid_page.dart';
import 'package:flutter/material.dart';

class IconexExampleApp extends StatelessWidget {
  const IconexExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iconex Example',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF4F46E5),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: const _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Iconex — Example'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Light'),
              Tab(text: 'Filled'),
              Tab(text: 'Broken'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              IconGridPage(
                title: 'Iconex Light',
                entries: lightIcons,
                iconBuilder: lightIconFor,
              ),
              IconGridPage(
                title: 'Iconex Filled',
                entries: filledIcons,
                iconBuilder: filledIconFor,
              ),
              IconGridPage(
                title: 'Iconex Broken',
                entries: brokenIcons,
                iconBuilder: brokenIconFor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
