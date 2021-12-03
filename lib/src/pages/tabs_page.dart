import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/pages/pages.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider binds the ChangeNotifier to a Widget (like a controller and view in MVC)
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _NavBar(),
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get an instance of the ChangeNotifier (controller)
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (i) => navigationModel.currentPage = i,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'For you'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Headlines'),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Tab1Page(),
        Container(color: Colors.green),
      ],
    );
  }
}

// Create the change notifier (kind of a controller)
class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    _pageController.animateToPage(
      value,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
