import 'package:flutter/widgets.dart';

class AppScale {
  BuildContext _ctxt;

  double scaledWidth() {
    return MediaQuery.of(_ctxt).size.width;
  }

  double scaledHeight() {
    return MediaQuery.of(_ctxt).size.height;
  }
}
