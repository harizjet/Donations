import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:ztour_apps1/Pages/Volunteering_Page/home_volunteer.dart';

import 'arc_banner_req.dart';
import 'req_model.dart';

// import 'arc_banner_image.dart';
// import 'models.dart';
// import 'poster.dart';

class ReqDetailHeader extends StatelessWidget {
  ReqDetailHeader(this.req);
  final Req req;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ArcBannerReq(req.bannerUrl);
    //Padding
  }
}
