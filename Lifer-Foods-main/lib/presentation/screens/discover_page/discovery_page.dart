import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Your Widget if you want',
                  ),
                ),
              ),
              TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.red,
                tabs: const [
                  Tab(
                    icon: Icon(Icons.person),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.add,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.deck,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.child_care,
                    ),
                  ),
                ],
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              Flexible(
                child: TabBarView(
                  controller: tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: Column(children: [
                        Container(
                          height: 300,
                        ),
                        Container(
                          height: 300,
                        ),
                        Container(
                          height: 300,
                        ),
                        Container(
                          height: 300,
                        ),
                        Container(
                          height: 300,
                        ),
                        Container(
                          height: 300,
                        ),
                      ]),
                    ),
                    Center(
                      child: Text(
                        'Screen 2',
                      ),
                    ),
                    Center(
                      child: Text(
                        'Screen 3',
                      ),
                    ),
                    Center(
                      child: Text(
                        'Screen 4',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
