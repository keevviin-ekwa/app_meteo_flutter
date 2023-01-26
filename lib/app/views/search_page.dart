import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meteo_app/app/widgets/bottom_nav.dart';
import 'package:meteo_app/app/widgets/custom_input.dart';
import 'package:meteo_app/app/widgets/custom_search_delegate.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int menuSelected = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0C093C),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            backgroundColor: const Color(0XFF0C093C),
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Column(
              children: [
                Text("Selectionner un lieux",
                    style: GoogleFonts.lilitaOne(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            //expandedHeight: 150,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: CustomInput(),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            for (int i = 0; i < 15; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: const ListTile(
                    title: Text("Douala"),
                  ),
                ),
              )
          ]))
        ],
      ),
      bottomNavigationBar: BottomNav(menuSelected: menuSelected),
    );
  }
}
