import 'package:flutter/material.dart';
import 'package:poke_swipe/features/poke_swipe/presentation/page/favourite_pokemon_page.dart';
import 'package:poke_swipe/features/poke_swipe/presentation/page/pokemon_swipe_page.dart';
import 'core/layout/layout_helpers.dart';
import 'core/utils/network_util.dart';
import 'ui/no_network_page.dart';
import 'ui/error_page.dart';
import 'features/settings/settings_page.dart';

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({super.key});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int _selectedIndex = 0;
  bool _hasNetwork = true;
  bool _checkingNetwork = true;

  static final List<Widget> _pages = <Widget>[
    PokemonSwipePage(key: UniqueKey()),
    const FavouritePokemonPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _checkNetwork();
    NetworkUtil.onConnectionChanged.listen((_) => _checkNetwork());
  }

  Future<void> _checkNetwork() async {
    setState(() {
      _checkingNetwork = true;
    });
    final hasNetwork = await NetworkUtil.checkInternetConnection();
    setState(() {
      _hasNetwork = hasNetwork;
      _checkingNetwork = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_checkingNetwork) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (!_hasNetwork) {
      return NoNetworkPage(onRetry: _checkNetwork);
    }
    return AdaptiveNavigation(
      selectedIndex: _selectedIndex,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.catching_pokemon), label: 'Catch'),
        NavigationDestination(icon: Icon(Icons.star), label: 'Favourite'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: IndexedStack(
        index: _selectedIndex,
        children: [
          PokemonSwipePage(),
          FavouritePokemonPage(key: UniqueKey()),
          const SettingsPage(),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('FlutterX Components')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.error_outline, color: Colors.redAccent),
              title: const Text('Generic Error Page'),
              subtitle: const Text('Show a customizable error page.'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ErrorPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
}
