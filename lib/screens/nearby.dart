import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_chef/config/colors.dart';
import 'package:pocket_chef/config/style.dart';
import 'package:pocket_chef/utils/fade_in.dart';

class Nearby extends StatefulWidget {
  const Nearby({Key key}) : super(key: key);

  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
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
          Center(
              child: PrimaryText(
                  text: 'Store Near By', size: 40, color: primaryText))),
    );
  }
}
