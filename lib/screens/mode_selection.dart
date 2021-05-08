import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:pocket_chef/constants/colors.dart';
import 'package:pocket_chef/constants/dimens.dart';
import 'package:pocket_chef/constants/fonts.dart';
import 'package:pocket_chef/screens/chef_profile.dart';
import 'package:pocket_chef/screens/foodie_profile.dart';
import 'package:pocket_chef/screens/login_screen.dart';
import 'package:pocket_chef/utils/fade_in.dart';

class ModeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) {
            return Stack(
              children: [
                BackgroundVideo(),
                Align(
                  child: Center(
                      child: SingleChildScrollView(
                          child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ModeText(),
                      const SizedBox(height: 30.0),
                      SelectionRow()
                    ],
                  ))),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    //can also have flare animations
  }
}

class ModeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      0.5,
      GlowText(
        'What are you today?',
        style: TextStyle(
            color: accent,
            fontFamily: indie,
            fontWeight: FontWeight.w600,
            fontSize: 40),
      ),
    );
  }
}

class SelectionRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      1,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ChefMode(), const SizedBox(width: 30.0), FoodieMode()],
      ),
    );
  }
}

class ChefMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlowButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChefProfilePage()));
      },
      color: accent,
      child: Text(
        'Chef',
        style: TextStyle(
            color: primaryText,
            fontFamily: indie,
            fontWeight: FontWeight.w600,
            fontSize: biggerText),
      ),
    );
  }
}

class FoodieMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlowButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodieProfilePage()));
      },
      color: accent,
      child: Text(
        'Foodie',
        style: TextStyle(
            color: primaryText,
            fontFamily: indie,
            fontWeight: FontWeight.w600,
            fontSize: biggerText),
      ),
    );
  }
}
