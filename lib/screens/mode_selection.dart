import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:pocket_chef/config/colors.dart';
import 'package:pocket_chef/config/dimens.dart';
import 'package:pocket_chef/config/fonts.dart';
import 'package:pocket_chef/reusable_widgets/background_video.dart';
import 'package:pocket_chef/reusable_widgets/bottom_app_bar.dart';
import 'package:pocket_chef/utils/fade_in.dart';

class ModeSelectionPage extends StatefulWidget {
  @override
  _ModeSelectionPageState createState() => _ModeSelectionPageState();
}

class _ModeSelectionPageState extends State<ModeSelectionPage> {
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
                  child: GlassmorphicContainer(
                    width: 400,
                    height: 200,
                    borderRadius: 20,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    border: 2,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(0.1),
                          Color(0xFFFFFFFF).withOpacity(0.05),
                        ],
                        stops: [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.5),
                        Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
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
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
            context: context,
            builder: (context) => AssetGiffyDialog(
                  buttonCancelColor: Colors.redAccent,
                  buttonOkColor: primaryLighter,
                  image: Image.asset(
                    'assets/panBig.gif',
                    fit: BoxFit.cover,
                  ),
                  title: GlowText(
                    'Signing Out',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: secondaryText,
                        fontFamily: indie,
                        fontSize: biggerText,
                        letterSpacing: 1.5),
                  ),
                  entryAnimation: EntryAnimation.TOP,
                  description: Text(
                    'Are you sure?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: secondaryText,
                        fontFamily: indie,
                        fontSize: biggerText,
                        letterSpacing: 1.5),
                  ),
                  onOkButtonPressed: () {
                    Navigator.of(context).pop(true);
                    //navigating back to login screen
                    // Navigator.popUntil(context, ModalRoute.withName('/login'));
                  },
                )) ??
        false;
  }

  @override
  void dispose() {
    super.dispose();
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomBar()));
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomBar()));
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
