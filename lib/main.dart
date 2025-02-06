import 'package:flutter/material.dart';

void main() {
  runApp(PetApp());
}

// PetApp is a StatelessWidget that sets up the MaterialApp.
class PetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner.
      home: DefaultTabController(
        length: 4, // 4 pet tabs
        child: _PetTabsDemo(),
      ),
    );
  }
}

// StatefulWidget to manage the tab functionality
class _PetTabsDemo extends StatefulWidget {
  @override
  __PetTabsDemoState createState() => __PetTabsDemoState();
}

// State class that controls the pet tabs
class __PetTabsDemoState extends State<_PetTabsDemo>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;
  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'pet_tabs_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4, // 4 pet tabs
      vsync: this,
    );

    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List of pet names for tabs
    final petTabs = ['Dog', 'Cat', 'Bird', 'Rabbit'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Pet App'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final pet in petTabs) Tab(text: pet), // Dynamic pet tab creation
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // TAB 1: Dog Info
          Container(
            color: Colors.brown[100], // Background color
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://via.placeholder.com/150/0000FF/808080?text=Dog',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Dogs are loyal and friendly!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // TAB 2: Cat Info
          Container(
            color: Colors.orange[100], // Background color
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://via.placeholder.com/150/FFA500/FFFFFF?text=Cat',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Cats love to sleep and explore!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // TAB 3: Bird Info
          Container(
            color: Colors.yellow[100], // Background color
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://via.placeholder.com/150/FFFF00/000000?text=Bird',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Birds are colorful and can sing beautifully!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // TAB 4: Rabbit Info
          Container(
            color: Colors.pink[100], // Background color
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://via.placeholder.com/150/FFC0CB/000000?text=Rabbit',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Rabbits are cute and love to hop!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
