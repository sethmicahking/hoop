import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hoop/screens/teaminfo.dart';

// Generates list of teams in alphabetical order and displays as a card
List<Widget> teams(BuildContext context) {
  List<Widget> teamCard = [];
  Map allTeams = {}; // combine all teams into single map
  allTeams.addAll(eastID);
  allTeams.addAll(westID);
  for (String id in sortedIds) {
    teamCard.add(
      GestureDetector(
        onTap: () {
          print(allTeams[id][1]);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeamInfo(
                team: allTeams[id][0],
              ),
            ),
          );
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    child: CachedNetworkImage(
                      imageUrl: allTeams[id][2],
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    radius: 40,
                    backgroundColor: Colors.transparent,
                  ),
                  Text(
                    allTeams[id][0].toString().toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  return teamCard;
}