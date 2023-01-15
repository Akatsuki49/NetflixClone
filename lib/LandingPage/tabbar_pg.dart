import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Episodes extends StatefulWidget {
  const Episodes({Key? key}) : super(key: key);

  @override
  State<Episodes> createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {
  final seasons = ['Season 1', 'Season 2', 'Season 3'];

  String? value;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.03),
    return Column(
      children: [
        Container(
          height: size.height * 0.045,
          width: size.width * 0.25,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              alignment: Alignment.center,
              isExpanded: true,
              //icon: Icon(Icons.arrow_drop_down_outlined,
              //  size: 12, color: Colors.white),
              iconEnabledColor: Colors.white,

              //dropdownColor: Colors.transparent,
              items: seasons.map(buildMenuItem).toList(),
              dropdownColor: Colors.grey.withOpacity(0.3),
              onChanged: (value) => setState(() {
                this.value = value;
              }),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 15,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                color: Colors.red,
                height: 15,
                width: 15,
              ),
            );
          },
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Center(
        child: Text(
          item,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
        ),
      ));
}

class TrailersNMore extends StatelessWidget {
  const TrailersNMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Text('trailers', style: TextStyle(color: Colors.white, fontSize: 35)),
    );
  }
}

class MoreLikeThis extends StatelessWidget {
  const MoreLikeThis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('More', style: TextStyle(color: Colors.white, fontSize: 35)),
    );
  }
}
