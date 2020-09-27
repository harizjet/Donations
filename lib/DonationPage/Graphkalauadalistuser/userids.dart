class Instances {
  List listids;

  Instances(this.listids);
}

Instances createDonationUserID(record) {
  List temp = [];
  record.forEach(
    (key, value) {
      temp.add(key.toString());
    },
  );

  Instances userIDs = new Instances(temp);

  return userIDs;
}
