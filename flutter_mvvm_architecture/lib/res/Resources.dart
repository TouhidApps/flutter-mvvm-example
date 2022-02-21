import 'package:flutter/cupertino.dart';
import '../res/strings/BanglaStrings.dart';
import '../res/strings/Strings.dart';

import 'colors/AppColors.dart';
import 'dimentions/AppDimension.dart';
import 'strings/EnglishStrings.dart';

class Resources {

  final BuildContext _context;

  Resources(this._context);

  Strings get strings {
    // It could be from the user preferences or even from the current locale
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'bn':
        return BanglaStrings();
      default:
        return EnglishStrings();
    }
  }

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  static Resources of(BuildContext context){
    return Resources(context);
  }

}