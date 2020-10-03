import 'package:flutter/cupertino.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:ztour_Mobile/Pages/Animal_Dictionary_Page/reptiles/list_reptiles.dart';
//import 'package:ztour_apps1/Pages/Animal_Dictionary_Page/Amphibians/list_amphibians.dart';

//import 'Amphibians/list_amphibians.dart';
//import 'animal_details.dart';
//import 'animal_single_view.dart';
import 'Amphibians/list_amphibians.dart';
import 'bird/bird_list.dart';
import 'fish/fish_list.dart';
import 'mammals/list_mammals.dart';
import 'reptiles/list_reptiles.dart';
//import 'reptiles/list_reptiles.dart';

class CategoryAnimal {
  final int id;
  final String name;
  final IconData icon;
  final Widget action;
  CategoryAnimal({this.id, this.name, this.icon, this.action});
}

final List<CategoryAnimal> categories = [
  CategoryAnimal(
      id: 1,
      name: "Mammal",
      icon: FontAwesomeIcons.cat,
      action: ListMammal('Mammal', 'Mammals')),
  CategoryAnimal(
      id: 2,
      name: "Reptiles",
      icon: FontAwesomeIcons.solidHandLizard,
      action:  ListReptile('Reptile', 'Reptiles')),
  CategoryAnimal(
    id: 3,
    name: "Amphibians",
    icon: FontAwesomeIcons.frog,
    action: ListAmp('Amphibian', 'Amphibians')),
  
  CategoryAnimal(
    id: 4,
    name: "Fish",
    icon: FontAwesomeIcons.fish,
    action: ListFish('Fish', 'Fishes'),
  ),
  CategoryAnimal(
      id: 5,
      name: "Bird",
      icon: FontAwesomeIcons.kiwiBird,
      action: ListBird('Bird', 'Birds')),
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
