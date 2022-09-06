import 'package:flutter/material.dart';
import '../core/model/enums.dart';

const Color white = Color.fromRGBO(255 ,255, 255, 1.0);
const Color black = Color.fromRGBO(0,0,0, 1.0);

const Color dark = Color.fromRGBO(55 ,71, 79, 1);
const Color bright = Color.fromRGBO(240, 240, 240, 1.0);

const Color darkText = Color.fromRGBO(208, 208, 208, 1.0);
const Color brightText = Color.fromRGBO(89, 90, 93, 1.0);

const Color darkCard = Color.fromRGBO(69 ,90, 100,1);
const Color darkCard2 = Color.fromRGBO(34, 46, 53,1);
const Color brightCard = Color.fromRGBO(255,255,255,1);
const Color brightCard2 = Color.fromRGBO(205, 205, 205,1);


const Color red = Color.fromRGBO(239, 83, 80, 1);
const Color orange = Color.fromRGBO(255, 112, 67, 1);
const Color blue = Color.fromRGBO(66, 165, 245, 1);
const Color teal = Color.fromRGBO(38, 166, 154, 1);
const Color pink = Color.fromRGBO(236, 64, 122, 1);
const Color green = Color.fromRGBO(102, 187, 106, 1);
const Color lightGreen = Color.fromRGBO(174, 213, 129, 1);
const Color violet = Color.fromRGBO(171, 71, 189, 1);
const Color purole = Color.fromRGBO(126 ,87 ,194, 1);
const Color yellow = Color.fromRGBO(255 ,179 ,0, 1);
const Color indigo = Color.fromRGBO(21, 94, 117, 1.0);//Color.fromRGBO(63 ,81 ,181, 1);
const Color blueGrey = Color.fromRGBO(120 ,144 ,156, 1);
const Color brown = Color.fromRGBO(141 ,110 ,99, 1);
const Color cyan = Color.fromRGBO(0, 188, 212, 1.0);

const Color blueLink = Color.fromRGBO(119, 212, 204, 1.0);
const Color yellowLink =  Color.fromRGBO(212, 190, 119, 1.0);
const Color redLink = Color.fromRGBO(212, 119, 119, 1.0);
const Color tealLink = Color.fromRGBO(139, 212, 119, 1.0);
const Color puroleLink = Color.fromRGBO(119, 148, 212, 1.0);
const Color pinkLink = Color.fromRGBO(212, 119, 193, 1.0);
const Color brownLink = Color.fromRGBO(212, 147, 119, 1.0);

class ObjectColor {
  // NightType nightType = NightType.Dark;
  NightType nightType = NightType.Bright;
  ColerType colerType = ColerType.Indigo;
  ColerType colerLinkType = ColerType.Yellow;

  Color get base => _base();
  Color get baseTextColor => _baseTextColor();
  Color get linkColor => _linkColor();
  Color get baseBackground => _baseBackground();
  Color get cardBackground => _cardBackground();

  Color get baseIcon => _baseIcon();
  Color get baseBorderButton => _baseBorderButton();
  Color get baseBorder => _baseBorder();
  Color get baseBorder2 => _baseBorder2();
  Color get pupUpMenuBackground => _pupUpMenuBackground();
  Color get rightMenuBackground => nightType == NightType.Bright ?brightCard2:darkCard2;

  Color _base() {
    switch (colerType) {
      case ColerType.Red:
        return red;
      case ColerType.Orange:
        return orange;
      case ColerType.Blue:
        return blue ;
      case ColerType.Teal:
        return teal;
      case ColerType.Pink:
        return pink;
      case ColerType.Green:
        return green;
      case ColerType.LightGreen:
        return lightGreen;
      case ColerType.Violet:
        return violet;
      case ColerType.Purole:
        return purole;
      case ColerType.Yellow:
        return yellow;
      case ColerType.Indigo:
        return indigo;
      case ColerType.BlueGrey:
        return blueGrey;
      case ColerType.Brown:
        return brown;
      case ColerType.Cyan:
        return cyan;
    }

    return black;
  }
  Color _baseTextColor() {
    switch (nightType) {
      case NightType.Dark:
        return darkText;
      case NightType.Bright:
        return brightText;
    }
  }
  Color _linkColor() {
    switch (colerLinkType) {
      case ColerType.Red:
        return redLink;
      case ColerType.Purole:
        return puroleLink;
      case ColerType.Blue:
        return blueLink ;
      case ColerType.Teal:
        return tealLink;
      case ColerType.Pink:
        return pinkLink;
      case ColerType.Yellow:
        return yellowLink;
      case ColerType.Brown:
        return brownLink;
      default: return yellowLink;
    }
  }
  Color _baseBackground() {
    switch (nightType) {
      case NightType.Dark:
        return dark;
      case NightType.Bright:
        return bright;
    }

    return Color.fromRGBO(0,0,0, 1.0);
  }
  Color _cardBackground() {
    switch (nightType) {
      case NightType.Dark:
        return darkCard;
      case NightType.Bright:
        return brightCard;
    }

    return Color.fromRGBO(0,0,0, 1.0);
  }
  Color shadowBackground(double opacity ) {
    return Color.fromRGBO(base.red,base.green,base.blue,opacity);
  }
  Color opacity(Color color, double opacity ) {
    return Color.fromRGBO(color.red,color.green,color.blue,opacity);
  }
  Color _baseIcon() {
    switch (nightType) {
      case NightType.Dark:
        return Color.fromRGBO(210, 215, 217, 1.0);
      case NightType.Bright:
        return Color.fromRGBO(99, 99, 99, 1.0);
    }

    return Color.fromRGBO(0,0,0, 1.0);
  }
  Color _baseBorder () {
    switch (nightType) {
      case NightType.Dark:
        return Color.fromRGBO(91, 114, 128, 1.0);
      case NightType.Bright:
        return Color.fromRGBO(202, 203, 208, 1.0);
    }

    return Color.fromRGBO(0,0,0, 1.0);
  }

  Color _baseBorder2 () {
    switch (nightType) {
      case NightType.Dark:
        return Color.fromRGBO(50, 66, 74, 1.0);
      case NightType.Bright:
        return Color.fromRGBO(240, 240, 240, 1.0);
    }

    return Color.fromRGBO(0,0,0, 1.0);
  }
  Color _pupUpMenuBackground () {
    switch (nightType) {
      case NightType.Dark:
        return Color.fromRGBO(22, 27, 28, 1.0);
      case NightType.Bright:
        return Color.fromRGBO(217, 217, 217, 1.0);
    }

    return Color.fromRGBO(0,0,0, 1.0);
  }

  Color _baseBorderButton() {
    switch (colerType) {
      case ColerType.Red:
        return Color.fromRGBO(229, 154, 153, 1.0);
      case ColerType.Orange:
        return Color.fromRGBO(238, 185, 168, 1.0);
      case ColerType.Blue:
        return  Color.fromRGBO(153, 193, 226, 1.0);
      case ColerType.Teal:
        return Color.fromRGBO(157, 224, 217, 1.0);
      case ColerType.Pink:
        return Color.fromRGBO(243, 156, 185, 1.0);
      case ColerType.Green:
        return  Color.fromRGBO(189, 248, 191, 1.0);
      case ColerType.LightGreen:
        return  Color.fromRGBO(199, 231, 163, 1.0);
      case ColerType.Violet:
        return   Color.fromRGBO(212, 137, 226, 1.0);
      case ColerType.Purole:
        return  Color.fromRGBO(192, 161, 245, 1.0);
      case ColerType.Yellow:
        return   Color.fromRGBO(236, 195, 101, 1.0);
      case ColerType.Indigo:
        return Color.fromRGBO(124, 136, 199, 1.0) ;
      case ColerType.BlueGrey:
        return  Color.fromRGBO(166, 196, 210, 1.0);
      case ColerType.Brown:
        return  Color.fromRGBO(222, 176, 160, 1.0)  ;
      case ColerType.Cyan:
        return Color.fromRGBO(128, 221, 223, 1.0);
    }
    return Color.fromRGBO(0,0,0, 1.0);
  }

  Color textInput_Background(bool b) {
    switch (nightType) {
      case NightType.Dark:
        return b? darkCard : darkCard2;
      case NightType.Bright:
        return b? brightCard : brightCard2;
    }
  }
}