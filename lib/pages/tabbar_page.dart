import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/datas.dart';
import 'package:myapp/models/page_route.dart';
import 'package:myapp/pages/find_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/pages/products_selling_page.dart';
import 'package:myapp/viewsmarket/user_page.dart';
import 'package:provider/provider.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);
  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  late TabController tabController;
  PageController pageController=PageController();
  int _selectedPage=0;
  @override
  void initState() {
    tabController=TabController(length: 4, vsync: this, animationDuration: const Duration(milliseconds: 0));
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Map<String, Icon> tabViewsEnum = {
      'Home': Icon(Icons.production_quantity_limits, size: width / 15),
      'Alışveriş': Icon(Icons.production_quantity_limits, size: width / 15),
      'Find':Icon(Icons.search, size: width / 15),
      'Profil': Icon(Icons.person, size: width / 15),
      //'Sepet': Icon(Icons.shopping_cart, size: width / 15),


    };
    return DefaultTabController(
      length: tabViewsEnum.length,
      child: Scaffold(
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        //floatingActionButton: FloatingActionButton(child:const Icon(Icons.add), onPressed: () {},),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
            child: GNav(
              debug: true,
              //selectedIndex: _selectedPage,
              onTabChange: (value) {
                setState(() {
                  //_selectedPage=value;
                  tabController.index=value;
                });
              },
              //activeColor: ColorItems.hex,
              tabBackgroundGradient:const SweepGradient(colors:[Colors.blueGrey,Colors.white,Colors.blueGrey,]),
              tabActiveBorder: Border.all(),
              padding:const EdgeInsets.all(15),
              gap: 8,
              //curve: Curves.decelerate,
              backgroundColor: Colors.white,
              tabs:const [
                GButton(icon: Icons.home,text: 'Home'),
                GButton(icon: Icons.favorite_border,text: 'Selling'),
                GButton(icon: Icons.search,text: 'Search'),
                GButton(icon: Icons.settings,text: 'Settings')
              ],
            ),
          ),
        ),
        body: _tabBarView(tabController),
      ),
    );
  }

  TabBarView _tabBarView(TabController tabController) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: tabController,
      children: [
        HomePage(),
        ProductSellingPage(),
        //PageTwice(),
        FindPage(),
        UserPage()
        //const CartPage(),
      ],
    );
  }
}
class PageTwice extends StatelessWidget {
  const PageTwice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //int page=Provider.of<PageR>(context).selectedPage;
    return PageView(
      controller: PageController(),
      children:const [
        HomePage(),
        ProductSellingPage()
      ],
    );
  }
}
/*BottomAppBar(
          shape:const CircularNotchedRectangle(),
          //notchMargin: 10,
          color: ColorItems.white,
          child: TabBar(
            //overlayColor: MaterialStateProperty.all(Colors.red),
            controller: tabController,
            tabs: tabViewsEnum.keys
                .map((e) => Tab(
              icon: tabViewsEnum[e] ?? const Icon(Icons.question_mark),
            )).toList(),
          ),
        )*/

/*Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: GNav(
              activeColor: ColorItems.hex,

              onTabChange: (value) {
                tabController.index=value;
              },
              tabActiveBorder: Border.all(),
              padding: EdgeInsets.all(15),
              gap: 8,
              //curve: Curves.decelerate,
              backgroundColor: Colors.white,
              tabs: [
                GButton(icon: Icons.home,text: 'Home'),
                GButton(icon: Icons.favorite_border,text: 'Selling'),
                GButton(icon: Icons.search,text: 'Search'),
                GButton(icon: Icons.settings,text: 'Settings')
              ],
            ),
          ),
        ),*/