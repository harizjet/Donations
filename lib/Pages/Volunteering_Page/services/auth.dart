/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:ztour_mobile/Pages/Volunteering_Page/model/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }



 // Future 
  

  //register email phone number

  Future VolunteerRegister(String name, String email, String number, String gender, String field) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, name: null)

    } catch (e) {

    }
  }
}*/