import 'package:flutter/material.dart';
import 'package:zoom_clone/pages/root_app.dart';
import 'package:zoom_clone/theme/colors.dart';

class JoinMeetingPage extends StatefulWidget {

  @override
  _JoinMeetingPageState createState() => _JoinMeetingPageState();
}

class _JoinMeetingPageState extends State<JoinMeetingPage> {
  bool isSwitchedAudio = true;
  bool isSwitchedVideo = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: headerAndFooter,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
      child: getAppBar(),),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: headerAndFooter,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Text(
            "Close",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      title: const Text("Join a Meeting"),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Row(
            children: [
              Container(
                width: size.width * 0.3,
                height: 40,
              ),
              Container(
                width: size.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: TextField(
                    cursorColor: primary,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Meeting ID",
                        hintStyle: TextStyle(color: grey.withOpacity(0.3)),
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: grey,
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Join with a personal link name",
          style: TextStyle(color: primary),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Row(
            children: [
              Container(
                width: size.width * 0.3,
                height: 40,
              ),
              Container(
                width: size.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: TextField(
                    cursorColor: primary,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Screen Name",
                      hintStyle: TextStyle(color: grey.withOpacity(0.3)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (_) => RootApp()), (route) => false);
          },
          child: Container(
            width: size.width * 0.9,
            height: 50,
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(15)),
            child: const Center(
              child: const Text(
                "Join",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "If you recieved an invitation link, tab on the link again to join the meeting",
            style: TextStyle(color: grey.withOpacity(0.6), height: 1.3),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "JOIN OPTIONS",
              style: TextStyle(color: grey.withOpacity(0.6), height: 1.3),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Don't Connect To Audio",
                  style: TextStyle(
                      color: grey,
                      height: 1.3,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                    activeColor: primary,
                    value: isSwitchedAudio,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedAudio = value;
                      });
                    })
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Turn Off My Video",
                  style: const TextStyle(
                      color: grey,
                      height: 1.3,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                    activeColor: primary,
                    value: isSwitchedVideo,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedVideo = value;
                      });
                    })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
