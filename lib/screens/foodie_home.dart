import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_chef/config/colors.dart';
import 'package:pocket_chef/config/constant.dart';
import 'package:pocket_chef/config/style.dart';
import 'package:pocket_chef/screens/food_detail.dart';
import 'package:pocket_chef/utils/fade_in.dart';

class FoodieHome extends StatefulWidget {
  @override
  _FoodieHomeState createState() => _FoodieHomeState();
}

class _FoodieHomeState extends State<FoodieHome> {
  int selectedFoodCard = 0;
  List selectedCategoryList = popularPizzaList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/sazid.jpg'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: SvgPicture.asset('assets/menu.svg'),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: FadeIn(
        1,
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: PrimaryText(
                      text: 'Discover food!',
                      height: 1.1,
                      size: 42,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.search,
                        color: AppColors.secondary,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColors.lighterGray)),
                          hintText: 'Search..',
                          hintStyle: TextStyle(
                              color: AppColors.lightGray,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: PrimaryText(
                        text: 'Categories',
                        fontWeight: FontWeight.w700,
                        size: 22),
                  ),
                  SizedBox(
                    //TODO use media query here to be responsive
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodCategoryList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                        child: foodCategoryCard(
                            foodCategoryList[index]['imagePath'],
                            foodCategoryList[index]['name'],
                            index),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: PrimaryText(
                        text: 'Popular', fontWeight: FontWeight.w700, size: 22),
                  ),
                  Column(
                    children: List.generate(
                      selectedCategoryList.length,
                      (index) => popularFoodCard(
                          selectedCategoryList[index]['imagePath'],
                          selectedCategoryList[index]['name'],
                          selectedCategoryList[index]['weight'],
                          selectedCategoryList[index]['star']),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget popularFoodCard(
      String imagePath, String name, String weight, String star) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodDetail(imagePath)))
      },
      child: Container(
        margin: EdgeInsets.only(right: 25, left: 20, top: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 10, color: AppColors.lighterGray)],
          color: AppColors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          PrimaryText(
                            text: 'top of the week',
                            size: 16,
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: PrimaryText(
                            text: name, size: 22, fontWeight: FontWeight.w700),
                      ),
                      PrimaryText(
                          text: weight, size: 18, color: AppColors.lightGray),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Icon(Icons.add, size: 20),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.star, size: 12),
                          SizedBox(width: 5),
                          PrimaryText(
                            text: star,
                            size: 18,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              transform: Matrix4.translationValues(30.0, 25.0, 0.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[400], blurRadius: 20)
                  ]),
              child: Hero(
                tag: imagePath,
                child: Image.asset(imagePath,
                    width: MediaQuery.of(context).size.width / 2.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodCategoryCard(String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () => {
        setState(
          () => {
            print(index),
            selectedFoodCard = index,
            selectedCategoryList = foodCategoryList[index]['arrayMappedname'],
          },
        ),
      },
      child: Container(
        //todo use media query here for responsive
        width: 120,
        margin: EdgeInsets.only(right: 20, top: 20, bottom: 20),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                selectedFoodCard == index ? AppColors.primary : AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.lighterGray,
                blurRadius: 15,
              )
            ]),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(imagePath, width: 40),
              PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
