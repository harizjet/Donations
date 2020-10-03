import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

//Read all registration
Future<Map<String, String>> getAllDonationbyzoo() async {
  Map<String, String> donationnumber = {
    'Zoo Negara': '',
    'Zoo Taiping': '',
    'Zoo Melaka': '',
  };

  double donationnegara = 0;

  //Zoo Negara
  DataSnapshot dataSnapshotNegara =
      await databaseReference.child('Donations/ZooNegara').once();
  if (dataSnapshotNegara.value != null) {
    dataSnapshotNegara.value.forEach(
      (key, value) {
        donationnegara += double.parse(value['Amount'].split(' ')[1]);
      },
    );
  }

  double donationtaiping = 0;

  //Zoo Negara
  DataSnapshot dataSnapshotTaiping =
      await databaseReference.child('Donations/ZooTaiping').once();
  if (dataSnapshotTaiping.value != null) {
    dataSnapshotTaiping.value.forEach(
      (key, value) {
        donationtaiping += double.parse(value['Amount'].split(' ')[1]);
      },
    );
  }

  double donationmelaka = 0;

  //Zoo Negara
  DataSnapshot dataSnapshotMelaka =
      await databaseReference.child('Donations/ZooMelaka').once();
  if (dataSnapshotMelaka.value != null) {
    dataSnapshotMelaka.value.forEach(
      (key, value) {
        donationmelaka += double.parse(value['Amount'].split(' ')[1]);
      },
    );
  }

  donationnumber['Zoo Negara'] = donationnegara.toStringAsFixed(2);
  donationnumber['Zoo Taiping'] = donationtaiping.toStringAsFixed(2);
  donationnumber['Zoo Melaka'] = donationmelaka.toStringAsFixed(2);
  donationnumber['All Zoo'] = donationnegara.toStringAsFixed(2) +
      donationtaiping.toStringAsFixed(2) +
      donationmelaka.toStringAsFixed(2);

  print(donationnumber);
  return donationnumber;
}
