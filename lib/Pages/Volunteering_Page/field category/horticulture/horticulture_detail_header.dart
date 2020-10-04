import 'dart:io';

import 'package:flutter/material.dart';

import 'arc_banner_horticulture.dart';
import 'horticulture_model.dart';




// import 'arc_banner_image.dart';
// import 'models.dart';
// import 'poster.dart';

class HorticultureDetailHeader extends StatelessWidget {
  HorticultureDetailHeader(this.horticulture);
  final Horticulture horticulture;
  
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ArcBannerHorticulture(horticulture.bannerUrl);
  }
}