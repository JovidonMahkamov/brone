import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/home_widgets/cafe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aziza Alimova',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xff22348A)),
                  Text(
                    'Toshkent sh. Sergeli tumani',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Color(0xff22348A),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.filter_list, color: Color(0xff22348A)),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: Color(0xff22348A)),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Color(0xff22348A)),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: TabBar(
              tabAlignment: TabAlignment.center,
              dividerColor: Colors.transparent,
              isScrollable: true,
              labelColor: Color(0xff22348A),
              unselectedLabelColor: Color(0xffB8BFE1),
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              tabs: const [
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Jarayondagilar"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Yakunlanganlar"),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding:  const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
                children:  [
                  CafeCard(
                    imagePath: 'assets/home/home.jpg',
                    description: 'Har bir mehmon o‘zini erkin va xotirjam his qiladigan...',
                    cafeName: 'Kafe nomi',
                    rating: 9.6,
                  ),
                  CafeCard(
                    imagePath: 'assets/home/home.jpg',
                    description: 'Har bir mehmon o‘zini erkin va xotirjam his qiladigan...',
                    cafeName: 'Kafe nomi',
                    rating: 9.6,
                  ),
                  CafeCard(
                    imagePath: 'assets/home/home.jpg',
                    description: 'Har bir mehmon o‘zini erkin va xotirjam his qiladigan...',
                    cafeName: 'Kafe nomi',
                    rating: 9.6,
                  ),
                  CafeCard(
                    imagePath: 'assets/home/home.jpg',
                    description: 'Har bir mehmon o‘zini erkin va xotirjam his qiladigan...',
                    cafeName: 'Kafe nomi',
                    rating: 9.6,
                  ),
                  CafeCard(
                    imagePath: 'assets/home/home.jpg',
                    description: 'Har bir mehmon o‘zini erkin va xotirjam his qiladigan...',
                    cafeName: 'Kafe nomi',
                    rating: 9.6,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
                children: const [
                  CafeCard(
                    imagePath: 'assets/home/home.jpg',
                    description: 'Har bir mehmon o‘zini erkin va xotirjam his qiladigan...',
                    cafeName: 'Kafe nomi',
                    rating: 9.6,
                  ),
                  CafeCard(
                    imagePath: 'assets/home/home.jpg',
                    description: 'Har bir mehmon o‘zini erkin va xotirjam his qiladigan...',
                    cafeName: 'Kafe nomi',
                    rating: 9.6,
                  ),
                  CafeCard(
                    imagePath: 'assets/home/home.jpg',
                    description: 'Har bir mehmon o‘zini erkin va xotirjam his qiladigan...',
                    cafeName: 'Kafe nomi',
                    rating: 9.6,
                  ),
                  CafeCard(
                    imagePath: 'assets/home/home.jpg',
                    description: 'Har bir mehmon o‘zini erkin va xotirjam his qiladigan...',
                    cafeName: 'Kafe nomi',
                    rating: 9.6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
