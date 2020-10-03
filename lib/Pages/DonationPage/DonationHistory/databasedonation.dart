import 'package:firebase_database/firebase_database.dart';
import 'donationHistory.dart';
import 'package:firebase_auth/firebase_auth.dart';

final databaseReference = FirebaseDatabase.instance.reference();

final FirebaseAuth auth = FirebaseAuth.instance;

//get user uid
inputData() async {
  final FirebaseUser user = await auth.currentUser();
  return user.uid;
}

Future<DatabaseReference> saveDonation(Donation donation) async {
  var userUID = await inputData();

  var id = databaseReference.child('Users/${userUID}/Donation').push();
  id.set(donation.toJson());
  return id;
}

void totalDonation(Donation donation) async {
  var id = databaseReference.child('Donations/totalDonation').push();
  id.set(donation.toJsonSpecial());
}

void negaraDonation(Donation donation) async {
  var id = databaseReference.child('Donations/ZooNegara').push();
  id.set(donation.toJsonSpecial());
}

void taipingDonation(Donation donation) async {
  var id = databaseReference.child('Donations/ZooTaiping').push();
  id.set(donation.toJsonSpecial());
}

void melakaDonation(Donation donation) async {
  var id = databaseReference.child('Donations/ZooMelaka').push();
  id.set(donation.toJsonSpecial());
}

Future<List<Donation>> getAllDonations() async {
  var userUID = await inputData();
  DataSnapshot dataSnapshot =
      await databaseReference.child('Users/${userUID}/Donation').once();
  List<Donation> donations = [];
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach(
      (key, value) {
        Donation donation = createDonation(value);
        donation
            .setId(databaseReference.child('Users/${userUID}/Donation' + key));
        donations.add(donation);
      },
    );
  }

  return donations;
}
