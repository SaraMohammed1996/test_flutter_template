import 'package:flutter/material.dart';
import 'package:test_flutter_template/core/extensions/theme_extensions.dart';
import 'package:test_flutter_template/features/products/presentation/screens/products_screen.dart';
import 'package:test_flutter_template/features/profile/presentation/screens/profile_screen.dart';
import 'package:test_flutter_template/l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const List<Widget> _tabs = <Widget>[
    ProductsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: context.themeBackground,
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: context.themeSurface,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() => _currentIndex = index);
        },
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: const Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(
              Icons.inventory_2,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: l10n.products,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: l10n.profile,
          ),
        ],
      ),
    );
  }
}
