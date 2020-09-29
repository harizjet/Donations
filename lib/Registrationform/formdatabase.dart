import 'package:firebase_database/firebase_database.dart';
import 'formcreated.dart';

final databaseReference = FirebaseDatabase.instance.reference();

//Write all registration
void negaraRegistration(Registrationform form) async {
  var id = databaseReference.child('Volunteering/ZooNegara').push();
  id.set(form.toJson());
}

void taipingRegistration(Registrationform form) async {
  var id = databaseReference.child('Volunteering/ZooTaiping').push();
  id.set(form.toJson());
}

void melakaRegistration(Registrationform form) async {
  var id = databaseReference.child('Volunteering/ZooMelaka').push();
  id.set(form.toJson());
}

//Finish all registration

//Read all registration
Future<Map<String, int>> getAllRegistration() async {
  Map<String, int> registrationnumber = {
    'All zoos': 0,
    'Zoo Negara': 0,
    'Zoo Taiping': 0,
    'Zoo Melaka': 0,
  };

  int numbernegara = 0;
  try {
    //Zoo Negara
    DataSnapshot dataSnapshotNegara =
        await databaseReference.child('Volunteering/ZooNegara').once();
    if (dataSnapshotNegara.value != null) {
      dataSnapshotNegara.value.forEach(
        (key, value) {
          numbernegara++;
        },
      );
    }
  } catch (err) {
    print(err);
    numbernegara = 0;
    print('NO Data yet');
  }

  int numbertaiping = 0;
  try {
    //Zoo Taiping
    DataSnapshot dataSnapshotTaiping =
        await databaseReference.child('Volunteering/ZooTaiping').once();
    if (dataSnapshotTaiping.value != null) {
      dataSnapshotTaiping.value.forEach(
        (key, value) {
          numbertaiping++;
        },
      );
    }
  } catch (err) {
    print(err);
    numbertaiping = 0;
    print('NO Data yet');
  }

  int numbermelaka = 0;
  try {
    //Zoo Melaka
    DataSnapshot dataSnapshotMelaka =
        await databaseReference.child('Volunteering/ZooMelaka').once();

    if (dataSnapshotMelaka.value != null) {
      dataSnapshotMelaka.value.forEach(
        (key, value) {
          numbermelaka++;
        },
      );
    }
  } catch (err) {
    print(err);
    print('NO Data yet');
  }

  registrationnumber['Zoo Negara'] = numbernegara;
  registrationnumber['Zoo Taiping'] = numbertaiping;
  registrationnumber['Zoo Melaka'] = numbermelaka;
  registrationnumber['All zoos'] = numbernegara + numbertaiping + numbermelaka;

  return registrationnumber;
}
