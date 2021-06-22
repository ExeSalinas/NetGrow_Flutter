import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Background({this.child});
  final Widget? child;
  static const String backgroundImg =
      r"https://images.unsplash.com/photo-1477768663691-75454fd8e870?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80";

  @override
  Widget build(BuildContext context) {
    final _mq = MediaQuery.of(context);
    return
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(backgroundImg, scale: 1.0),
            ),
          ),
          child:Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius:
                  BorderRadius.all(Radius.circular(_mq.size.width * 0.03))),
              width: (_mq.size.width * 0.45 > 400) ? _mq.size.width * 0.5 : 400,
              padding: EdgeInsets.all(20.0),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _mq.size.width * 0.04,
                  vertical: _mq.size.height * 0.03,
                ),
                child: child,
              ),
            ),
          )
          ,
          /* add child content here */
        )
   ;
  }
}
