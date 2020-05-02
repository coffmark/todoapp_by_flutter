import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

class TweetButton extends StatefulWidget {

  @override
  _TweetButtonState createState() => _TweetButtonState();
}

class _TweetButtonState extends State<TweetButton> {

  static const channel = MethodChannel('com.twitterconnection');

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onpressedButton,
      backgroundColor: Colors.red,
      child: FaIcon(FontAwesomeIcons.hashtag),
    );
  }

  Future<void> _onpressedButton() async {
    try{
      await channel.invokeMethod('tweet');
    }on PlatformException catch(e){
      print(e);
    }

  }
}