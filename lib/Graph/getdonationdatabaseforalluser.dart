import 'package:firebase_database/firebase_database.dart';
import 'graph.dart';

final databaseReference = FirebaseDatabase.instance.reference();

// looping every user donation
Future<List<TimeSeriesDonation>> getAllDonationforallUsers() async {
  List<TimeSeriesDonation> donations = [];

  DataSnapshot dataSnapshot =
      await databaseReference.child('donation/totalDonation').once();

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach(
      (key, value) {
        TimeSeriesDonation donation = createTimeseries(value);
        donations.add(donation);
      },
    );
  }

  return donations;
}
