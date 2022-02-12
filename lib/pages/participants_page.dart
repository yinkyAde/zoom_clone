import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:zoom_clone/json/participants_json.dart';
import 'package:zoom_clone/theme/colors.dart';

class ParticipantsPage extends StatefulWidget {

  @override
  _ParticipantsPageState createState() => _ParticipantsPageState();
}

class _ParticipantsPageState extends State<ParticipantsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: headerAndFooter,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), child: getAppBar()),
      bottomSheet: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 70),
      child: Column(
          children: List.generate(participants.length, (index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(participants[index]['img']),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        participants[index]['name'],
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        MaterialCommunityIcons.microphone,
                        color: grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        index == 0
                            ? MaterialCommunityIcons.video
                            : MaterialCommunityIcons.video_off,
                        color: index == 0 ? grey : red,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider()
          ],
        );
      })),
    ));
  }

  Widget getAppBar() {
    var participantsCount = participants.length;
    return AppBar(
      backgroundColor: headerAndFooter,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: const Text(
            "Close",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      title: Text("Participants ($participantsCount)"),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      decoration: const BoxDecoration(color: black),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: headerAndFooter,
                  borderRadius: BorderRadius.circular(8)),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Invite",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
