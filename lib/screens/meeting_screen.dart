import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    createMeeting() async {
      var random = Random();
      String roomName = (random.nextInt(10000000) + 10000000).toString();
      JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
      _jitsiMeetMethods.createNewMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    }

    joinMeeting() {
      Navigator.pushNamed(context, '/video-call');
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createMeeting,
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onPressed: joinMeeting,
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text(
              'Create/Join Meetings with just a click!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        )
      ],
    );
  }
}
