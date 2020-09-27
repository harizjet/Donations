import 'package:firebase_database/firebase_database.dart';
import 'existingcard.dart';
import 'package:firebase_auth/firebase_auth.dart';

final databaseReference = FirebaseDatabase.instance.reference();

final FirebaseAuth auth = FirebaseAuth.instance;

inputData() async {
  final FirebaseUser user = await auth.currentUser();
  return user.uid;
}

Future getKey() async {
  var userUID = await inputData();

  var id = databaseReference.child('CardBank/${userUID}').push();
  return id;
}

Future<DatabaseReference> saveCardBank(
    CardBank CardBank, DatabaseReference key) async {
  key.set(CardBank.toJson());
  return key;
}

Future<List<CardBank>> getAllCardBanks() async {
  var userUID = await inputData();
  DataSnapshot dataSnapshot =
      await databaseReference.child('CardBank/${userUID}').once();
  List<CardBank> cards = [];
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach(
      (key, value) {
        CardBank card = createCredit(value);
        card.setId(databaseReference.child('CardBank/${userUID}' + key));
        cards.add(card);
      },
    );
  }

  return cards;
}
