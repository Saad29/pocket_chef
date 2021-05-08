import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:pocket_chef/constants/colors.dart';
import 'package:pocket_chef/constants/dimens.dart';
import 'package:pocket_chef/constants/fonts.dart';
import 'package:pocket_chef/screens/mode_selection.dart';
import 'package:video_player/video_player.dart';

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
}

class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/pocket_chef_login.mp4");
    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized.
      setState(() {});
      // Once the video has been loaded we play the video and set looping to true.
      _controller.play();
      _controller.setLooping(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        // If your background video doesn't look right, try changing the BoxFit property.
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size?.width ?? 0,
          height: _controller.value.size?.height ?? 0,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _timer.cancel();
    _controller.dispose();
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
