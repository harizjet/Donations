import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:ztour_mobile/Pages/DonationPage/AlertDialog_widget.dart';
import 'package:ztour_mobile/Pages/DonationPage/zooOption.dart';
import 'formcreated.dart';
import 'package:flushbar/flushbar.dart';

class RegistrationForm extends StatefulWidget {
  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }
}

class RegistrationFormState extends State<RegistrationForm> {
  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  final ValueChanged _onChanged = (val) => print(val);
  var genderOptions = ['Male', 'Female', 'Other'];

  var occupationOptions = [
    'Full-time worker',
    'Full-time student',
    'Part-time worker',
    'Part-time student',
    'Others'
  ];

  final _ageController = TextEditingController();
  bool _ageHasError = false;

  final _nameController = TextEditingController();
  bool _nameHasError = false;

  final _nricController = TextEditingController();
  bool _nricHasError = false;

  final _emailController = TextEditingController();
  bool _emailHasError = false;

  String zooName;

  zooRequirement(BuildContext context) {
    VoidCallback continueCallBack = () => {
          Navigator.of(context).pop(),
        };
    BlurryDialog alert = BlurryDialog(
        "Requirement", "Please select the zoo first.", continueCallBack);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteer Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            FormBuilder(
              // context,
              key: _fbKey,
              // autovalidate: true,
              readOnly: false,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    attribute: 'Name',
                    // autovalidate: true,
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Name',
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          if (_nameHasError == true)
                            Icon(Icons.error, color: Colors.red),
                          if (_nameHasError == false &&
                              _nameController.text != '')
                            Icon(Icons.check, color: Colors.green)
                        ],
                      ),
                    ),
                    onChanged: (val) {
                      print(val);
                      setState(() {
                        _nameHasError = !_fbKey
                            .currentState.fields['Name'].currentState
                            .validate();
                      });
                    },
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 15),
                  FormBuilderTextField(
                    attribute: 'Age',
                    // autovalidate: true,
                    controller: _ageController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        labelText: 'Age',
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            if (_ageHasError == true)
                              Icon(Icons.error, color: Colors.red),
                            if (_ageHasError == false &&
                                _ageController.text != '')
                              Icon(Icons.check, color: Colors.green)
                          ],
                        )),
                    onChanged: (val) {
                      print(val);
                      setState(() {
                        _ageHasError = !_fbKey
                            .currentState.fields['Age'].currentState
                            .validate();
                      });
                    },
                    valueTransformer: (text) {
                      return text == null ? null : num.tryParse(text);
                    },
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ],
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15),
                  FormBuilderTextField(
                    attribute: 'NRIC',
                    // autovalidate: true,
                    controller: _nricController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.credit_card),
                        labelText: 'NRIC',
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            if (_nricHasError == true)
                              Icon(Icons.error, color: Colors.red),
                            if (_nricHasError == false &&
                                _nricController.text != '')
                              Icon(Icons.check, color: Colors.green)
                          ],
                        )),
                    onChanged: (val) {
                      print(val);
                      setState(() {
                        _nricHasError = !_fbKey
                            .currentState.fields['NRIC'].currentState
                            .validate();
                      });
                    },

                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.minLength(12),
                    ],
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15),
                  FormBuilderTextField(
                    attribute: 'Email',
                    // autovalidate: true,
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            if (_emailHasError == true)
                              Icon(Icons.error, color: Colors.red),
                            if (_emailHasError == false &&
                                _emailController.text != '')
                              Icon(Icons.check, color: Colors.green)
                          ],
                        )),
                    onChanged: (val) {
                      print(val);
                      setState(() {
                        _emailHasError = !_fbKey
                            .currentState.fields['Email'].currentState
                            .validate();
                      });
                    },

                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 15),
                  FormBuilderPhoneField(
                    attribute: 'Contact',
                    defaultSelectedCountryIsoCode: 'MY',
                    cursorColor: Colors.black,
                    // style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Contact',
                    ),
                    onChanged: _onChanged,
                    priorityListByIsoCode: ['MY'],
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'This field required')
                    ],
                  ),
                  SizedBox(height: 15),
                  FormBuilderDropdown(
                    attribute: 'Gender',
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.people),
                      labelText: 'Gender',
                    ),
                    // initialValue: 'Male',
                    hint: Text('Select Gender'),
                    validators: [FormBuilderValidators.required()],
                    items: genderOptions
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text('$gender'),
                            ))
                        .toList(),
                    // isExpanded: false,
                    // allowClear: true,
                  ),
                  SizedBox(height: 15),
                  FormBuilderDropdown(
                    attribute: 'Occupation',
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.work),
                      labelText: 'Occupation',
                    ),
                    // initialValue: 'Male',
                    hint: Text('Select Occupation'),
                    validators: [FormBuilderValidators.required()],
                    items: occupationOptions
                        .map((occupation) => DropdownMenuItem(
                              value: occupation,
                              child: Text('$occupation'),
                            ))
                        .toList(),
                    // isExpanded: false,
                    // allowClear: true,
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: new ListTile(
                      leading: Icon(Icons.home),
                      trailing: Icon(Icons.cloud_circle),
                      title: Text('Zoo'),
                      subtitle: (this.zooName != null)
                          ? Text(this.zooName)
                          : Text('Select Zoo'),
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ZooOptions(),
                          ),
                        );
                        setState(
                          () {
                            this.zooName = result;
                            _fbKey.currentState.value
                                .putIfAbsent('zooName', () => result);
                          },
                        );
                      },
                    ),
                  ),
                  Divider(color: Colors.black, height: 15),
                  FormBuilderCheckboxGroup(
                    decoration: InputDecoration(labelText: 'Available time'),
                    attribute: 'Available_time',
                    initialValue: ['Public Holiday'],
                    options: [
                      FormBuilderFieldOption(value: 'Weekend'),
                      FormBuilderFieldOption(value: 'Weekday'),
                      FormBuilderFieldOption(value: 'Public Holiday'),
                    ],
                    onChanged: _onChanged,
                  ),
                  SizedBox(height: 15),
                  FormBuilderSwitch(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    label: Text(
                        'I hereby expressly instruct Ztour to communicate specific information about me and my acount to third parties in accordance with the Privacy Policy.'),
                    attribute: 'accept_terms_switch',
                    initialValue: false,
                    onChanged: _onChanged,
                    validators: [FormBuilderValidators.requiredTrue()],
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (this.zooName == null) {
                        zooRequirement(context);
                      } else if (_fbKey.currentState.saveAndValidate() &&
                          this.zooName != '') {
                        print(_fbKey.currentState.value);
                        Navigator.of(context).pop();

                        Registrationform.newsubmission(
                            _fbKey.currentState.value['Name'],
                            _fbKey.currentState.value['Age'].toString(),
                            _fbKey.currentState.value['NRIC'].toString(),
                            _fbKey.currentState.value['Email'],
                            _fbKey.currentState.value['Contact'].toString(),
                            _fbKey.currentState.value['Gender'],
                            _fbKey.currentState.value['Occupation'],
                            _fbKey.currentState.value['Available_time']
                                .toString(),
                            this.zooName);
                        Flushbar(
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.blue,
                          ),
                          margin: EdgeInsets.all(8),
                          borderRadius: 8,
                          title: 'Congratulations',
                          message: 'Your form have been recorded.',
                          duration: Duration(seconds: 3),
                        )..show(context);
                      } else {
                        print(_fbKey.currentState.value);
                        print('validation failed');
                        Flushbar(
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.blue,
                          ),
                          margin: EdgeInsets.all(8),
                          borderRadius: 8,
                          title: 'Sorry',
                          message:
                              'Validation Failed, please enter the field correctly',
                          duration: Duration(seconds: 3),
                        )..show(context);
                      }
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                    child: MaterialButton(
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'Reset',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                RegistrationForm()));
                    // _nameController.text = '';
                    // _ageController.text = '';
                    // _nricController.text = '';
                    // _emailController.text = '';
                    // _fbKey.currentState.reset();
                  },
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
