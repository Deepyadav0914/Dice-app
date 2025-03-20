import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';

class Flare extends StatefulWidget {
  String animation = 'still';
  Flare({required this.animation});
  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<Flare> {
  @override
  Widget build(BuildContext context) {
    return FlareActor(
      "assets/DiceRoll.flr",
      alignment: Alignment.center,
      fit: BoxFit.fitHeight,
      animation: widget.animation,
    );
  }
}
