import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:pocket_chef/config/colors.dart';
import 'package:pocket_chef/config/dimens.dart';
import 'package:pocket_chef/config/fonts.dart';
import 'package:pocket_chef/reusable_widgets/background_video.dart';
import 'package:pocket_chef/screens/mode_selection.dart';

final TextEditingController _nameTextController = TextEditingController();
final TextEditingController _passTextController = TextEditingController();

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ///hides android status bar at top
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
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
                    AppNameText(),
                    const SizedBox(height: 30.0),
                    NameField(),
                    const SizedBox(height: 20.0),
                    PasswordField(),
                    const SizedBox(height: 20.0),
                    LoginButton()
                  ],
                ))),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class AppNameText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlowText(
      'Pocket Chef',
      style: TextStyle(
          color: accent,
          fontFamily: indie,
          fontWeight: FontWeight.w600,
          fontSize: hugeText),
    );
  }
}

//todo use the reusable widget, ask Samia for best practise
class NameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: transparentText,
      margin: const EdgeInsets.fromLTRB(60, 5, 60, 5),
      child: TextField(
        key: Key('NameFieldContainer'),
        style: TextStyle(
            color: primaryText,
            fontFamily: indie,
            fontWeight: FontWeight.w600,
            fontSize: biggerText),
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
            labelText: 'Name',
            hintStyle: TextStyle(
                fontSize: hugeText,
                color: primaryText,
                fontFamily: indie,
                fontWeight: FontWeight.w600),
            labelStyle: TextStyle(
                color: primaryText,
                fontFamily: indie,
                fontWeight: FontWeight.w600)),
        controller: _nameTextController,
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: transparentText,
      margin: const EdgeInsets.fromLTRB(60, 5, 60, 5),
      child: TextField(
        obscureText: true,
        key: Key('passwordFieldContainer'),
        style: TextStyle(
            color: primaryText,
            fontFamily: indie,
            fontWeight: FontWeight.w600,
            fontSize: biggerText),
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
            labelText: 'Password',
            hintStyle: TextStyle(
                fontSize: hugeText,
                color: primaryText,
                fontFamily: indie,
                fontWeight: FontWeight.w600),
            labelStyle: TextStyle(
                color: primaryText,
                fontFamily: indie,
                fontWeight: FontWeight.w600)),
        controller: _passTextController,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlowButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ModeSelectionPage()));
      },
      color: accent,
      child: Text(
        'Log In',
        style: TextStyle(
            color: primaryText,
            fontFamily: indie,
            fontWeight: FontWeight.w600,
            fontSize: biggerText),
      ),
    );
  }
}
