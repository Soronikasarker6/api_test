
import 'package:flutter/material.dart';
import 'fatch_data.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds: 1000)
    );
    _controller.repeat(reverse: true);
    super.initState();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Stack(
          fit: StackFit.expand,
          children:<Widget> [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
                Expanded(
                flex: 2, child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      RotationTransition(
                        turns: _controller,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50.0,
                          child: Image.asset("asset/logo.png"),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      SizeTransition(
                        sizeFactor: _controller,
                        axis: Axis.horizontal,
                        axisAlignment: -1,
                        child: Text("Restaurant", style: TextStyle(color: Colors.white,
                            fontSize: 24.0,letterSpacing: 2.0
                            , fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )),
                // Expanded(
                //     flex: 1,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children:<Widget> [
                //
                //         CircularProgressIndicator(),
                //         Padding(padding: EdgeInsets.only(top: 20.0)),
                //         Text("Online Service \n for Everyone", style: TextStyle(color: Colors.white,
                //             fontSize: 18.0, fontWeight: FontWeight.bold),
                //         )
                //       ],
                //     ))
              ],
            )
          ],
        ),
        nextScreen: FatchDataScreen(),
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: Colors.red,
      ),
    );
  }
}