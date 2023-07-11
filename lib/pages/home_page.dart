import 'package:flutter/material.dart';
import 'package:myapp/datas.dart';
import 'package:myapp/models/app_banner.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/models/page_route.dart';
import 'package:myapp/models/product_dao.dart';
import 'package:myapp/pages/products_selling_page.dart';
import 'package:myapp/project_paddings.dart';
import 'package:myapp/widgets/product_list_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = Datas().categories;
  late PageController _pageController;
  late ScrollController scrollController;
  var _selectedIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController(viewportFraction: 0.68,initialPage: 0);
    scrollController = ScrollController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //411.42857142857144
    double height = MediaQuery.of(context).size.height;
    Function getProductsByCategoryId=Provider.of<ProductDao>(context).getProductsByCategoryId;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(height: 65,color: Colors.yellow),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30))),
                    elevation: 0.5,
                    shadowColor: Colors.transparent,
                    minimumSize: Size(300, 65)
                  ),
                    onPressed: () {

                }, child: Text('asd'))
              ],
            ),
            //defaultTextStyle..
            Container(
                margin:const EdgeInsets.symmetric(vertical: 16),
                height: (height / 3),
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _selectedIndex=index;
                    });
                  },
                  controller: _pageController,
                  itemCount: appBannerList.length,
                  itemBuilder: (context, index) {
                    var _scale=_selectedIndex==index ? 1.0: 0.8;
                    return  TweenAnimationBuilder(
                      duration:const Duration(milliseconds: 350),
                        tween: Tween(begin: _scale,end: _scale),
                        curve: Curves.ease,
                        child: BannerItem(appBanner: appBannerList[index],),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value as double,
                          child: child,
                        );
                      },
                    );
                  },
                )),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              ...List.generate(appBannerList.length, (index) =>Indicator(isActive:_selectedIndex == index ? true:false) )
            ]),
            Padding(
              padding: ProjectPaddings.screenPadding,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: categories.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 1.25, top: 1.25, left: 2.5, right: 2.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductSellingPage(),));
                            getProductsByCategoryId(categories[index].categoryId);
                          },
                          child: Card(child: Image.asset('asset/png/bat.png')),
                        ),
                        Text(
                            (categories[index].categoryName.length) < 10
                                ? categories[index].categoryName
                                : '${categories[index].categoryName.substring(0, 10)}...',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontSize: 10.5)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    Key? key, required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:const Duration(milliseconds: 350),
      margin:const EdgeInsets.symmetric(horizontal: 2),
      width:isActive ?22: 8,
      height: 8,
      decoration: BoxDecoration(color:isActive?Colors.orange: Colors.grey,borderRadius: BorderRadius.circular(8)),);
  }
}

class BannerItem extends StatelessWidget {
  final AppBanner appBanner;
  const BannerItem({
    Key? key, required this.appBanner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          image: DecorationImage(
            fit: BoxFit.cover,
              image:
                  AssetImage(appBanner.thumbnailUrl))),
    );
  }
}