import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ztour_mobile/Setting/settingmain.dart';
import '../Setting/language1.dart';
import '../Setting/localization/localization_constant.dart';

class LanguagePage extends StatefulWidget {
  LanguagePage({Key key}) : super(key: key);

  String get languageCode => null;

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.orange,
        title: Text(
          getTranslated(context, "language_page"),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
          child: Center(
        child: DropdownButton<Language>(
          iconSize: 30,
          hint: Text(getTranslated(context, "change_language")),
          onChanged: (Language language) {
            _changeLanguage(language);
          },
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      )),
      /*body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10.0),
            Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("1. English (US), 🇺🇸 "),
                    //items: Language.languageList().map((e) => null),
                    onTap: () {}
                  ),
                  //_buildDivider(),
                  ListTile(
                    title: Text("2. Bahasa Melayu (Malay), 🇲🇾"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

          ],*/
    );
  }
}
