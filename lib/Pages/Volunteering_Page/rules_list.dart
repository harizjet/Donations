import 'package:flutter/cupertino.dart';
//import 'package:flutter_ui_challenges/src/pages/lists/animal_details02.dart';
//import 'package:flutter_ui_challenges/src/pages/lists/list_mammals.dart';
//import 'package:flutter_ui_challenges/src/pages/lists/list3.dart';
//import 'package:flutter_ui_challenges/src/pages/lists/list4.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/animal_details.dart';
//import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/list2.dart';
//import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/list3.dart';
//import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/list_reptiles.dart';

class RulesList {
  final int id;
  final String name;
  //final IconData icon;
 // final Widget action;
  RulesList({this.id, this.name});
}

final List<RulesList> categories001 = [
  RulesList(
      id: 1,
      name: "Applicant has to provide a copy of identification card (MyKad/passport) and student ID card along with the application."),

       RulesList(
      id: 2,
      name: "Applicant has to provide a copy of identification card (MyKad/passport) and student ID card along with the application."),
  
   RulesList(
      id: 3,
      name: "Applicant has to provide a copy of identification card (MyKad/passport) and student ID card along with the application."),
  
   RulesList(
      id: 4,
      name: "Applicant has to provide a copy of identification card (MyKad/passport) and student ID card along with the application."),
  
  
  // RulesList(
  //     id: 2,
  //     name: "Reptiles",
  //     icon: FontAwesomeIcons.solidHandLizard,
  //     action: ListReptiles()),
  // RulesList(
  //   id: 3,
  //   name: "Amphibians",
  //   icon: FontAwesomeIcons.frog,
  //   action: ListAmphibians(),
  // ),
  // RulesList(
  //   id: 4,
  //   name: "Fish",
  //   icon: FontAwesomeIcons.fish,
  //   action: ListMammal('Mammals', 'Mammal'),
  // ),
  // RulesList(
  //     id: 5,
  //     name: "Bird",
  //     icon: FontAwesomeIcons.kiwiBird,
  //     action: AnimalDetailsPage()),
];

class ListMammals {
  final int id;
  final String name;
  final dynamic icon;
  ListMammals(
    this.id,
    this.name,
    this.icon,
  );
}

//final List<ListMammals> categories01 = [
// ListMammals(9, "Malayan Tiger"),
// ListMammals(10, "Indochinese Leopard"),
// ListMammals(11, "Malayan Tapir"),
//ListMammals(12, "Fish"),
// ListMammals(13, "Birds"),
//];
