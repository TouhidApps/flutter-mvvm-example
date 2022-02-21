import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_architecture/res/Resources.dart';

extension AppContextExtension on BuildContext {
  Resources get resources => Resources.of(this);
}

