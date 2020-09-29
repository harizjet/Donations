import 'package:firebase_database/firebase_database.dart';
import 'formdatabase.dart';

class Registrationform {
  String Name;
  String Age;
  String NRIC;
  String Email;
  String Contact;
  String Gender;
  String Occupation;
  String Available_time;
  String Chosen_zoo;
  DatabaseReference _id;

  Registrationform(this.Name, this.Age, this.NRIC, this.Email, this.Contact,
      this.Gender, this.Occupation, this.Available_time, this.Chosen_zoo);

  static void newsubmission(
    String name,
    String age,
    String nrid,
    String email,
    String contact,
    String gender,
    String occupation,
    String available_time,
    String chosen_zoo,
  ) async {
    var submission = await Registrationform(name, age, nrid, email, contact,
        gender, occupation, available_time, chosen_zoo);

    if (chosen_zoo == 'Zoo Negara') {
      negaraRegistration(submission);
    } else if (chosen_zoo == 'Zoo Taiping') {
      taipingRegistration(submission);
    } else if (chosen_zoo == 'Zoo Melaka') {
      melakaRegistration(submission);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': this.Name,
      'Age': this.Age,
      'NRIC': this.NRIC,
      'Email': this.Email,
      'Contact': this.Contact,
      'Gender': this.Gender,
      'Occupation': this.Occupation,
      'Available time': this.Available_time,
      'Chosen Zoo': this.Chosen_zoo,
    };
  }
}
