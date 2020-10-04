import 'package:flutter/material.dart';
import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/dictionaryhome.dart';
import 'package:ztour_mobile/Pages/Covid19/covidhomepage.dart';
import '../../Pages/Quiz_Game_Page/quizhomepage.dart';
import 'package:ztour_mobile/Pages/Tour_Zoo_Page/discoverhomepage.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:ztour_mobile/Widgets/Dashboard/dashboard2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ztour_mobile/Pages/Login_Signup_Page/user_profile.dart';

class AnimatedBottomBar extends StatefulWidget {
  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getPage(_currentPage),
      bottomNavigationBar: SizedBox(
        height: 58,
        child: AnimatedBottomNav(
            currentIndex: _currentPage,
            onChange: (index) {
              setState(() {
                _currentPage = index;
              });
            }),
      ),
    );
  }

  getPage(int page) {
    switch (page) {
      case 0:
        return Center(
            child: Container(
          child: Dashboard2(),
        ));
      case 1:
        return Center(
            child: Container(
          child: ZooDestinationPage(),
        ));
      case 2:
        return Center(
            child: Container(
          child: AnimalHomePage(),
        ));
      case 3:
        return Center(
            child: Container(
          child: quizhomepage(),
        ));
      case 4:
        return Center(
            child: Container(
          child: Profile(),
        ));
    }
  }
}

class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChange;
  const AnimatedBottomNav({Key key, this.currentIndex, this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => onChange(0),
              child: BottomNavItem(
                icon: Icons.home,
                title: "Home",
                isActive: currentIndex == 0,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(1),
              child: BottomNavItem(
                icon: Icons.location_searching,
                title: "Tour",
                isActive: currentIndex == 1,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(2),
              child: BottomNavItem(
                icon: Icons.library_books,
                title: "Dict",
                isActive: currentIndex == 2,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(3),
              child: BottomNavItem(
                icon: Icons.games,
                title: "Games",
                isActive: currentIndex == 3,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(4),
              child: BottomNavItem(
                icon: Icons.person,
                title: "Profile",
                isActive: currentIndex == 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final Color activeColor;
  final Color inactiveColor;
  final String title;
  const BottomNavItem(
      {Key key,
      this.isActive = false,
      this.icon,
      this.activeColor,
      this.inactiveColor,
      this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 200),
      child: isActive
          ? Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: activeColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Icon(
                          icon,
                          color: inactiveColor ?? Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
