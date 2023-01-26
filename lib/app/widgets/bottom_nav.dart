import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meteo_app/app/views/home_page.dart';
import 'package:meteo_app/app/views/search_page.dart';

class BottomNav extends StatefulWidget {
  final int menuSelected;
  BottomNav({required this.menuSelected, Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int menuSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menuSelected = widget.menuSelected;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          menuSelected = index;
        });

        if (index == 0) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        } else if (index == 1) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SearchPage()));
        }
      },
      backgroundColor: Color(0XFF0C093C),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.home,
            color: menuSelected == 0 ? Colors.white : Colors.blue,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.search,
              color: menuSelected == 1 ? Colors.white : Colors.blue,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.slidersH,
              color: menuSelected == 2 ? Colors.white : Colors.blue,
            ),
            label: ""),
      ],
    );
  }
}
