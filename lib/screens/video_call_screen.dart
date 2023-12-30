import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  
  @override
  void initState() {
    meetingIdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createNewMeeting(roomName: meetingIdController.text, isAudioMuted: isAudioMuted, isVideoMuted: isVideoMuted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
        title: Text(
          'Join a Meeting',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: TextField(
                controller: meetingIdController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 0, 
                      style: BorderStyle.none,
                    )
                  ),
                  hintText: 'Room ID',
                  contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 0)
                ),  
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: _joinMeeting,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Join',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            MeetingOption(
              text: 'Mute Audio',
              isMute: isAudioMuted,
              onChange: onAudioMuted,
            ),
            const SizedBox(height: 10.0),
            MeetingOption(
              text: 'Turn Off My Video',
              isMute: isVideoMuted,
              onChange: onVideoMuted,
            )
          ],
        ),
      ),
    );
  }

  onAudioMuted (bool? val) {
    setState(() {
      isAudioMuted = val!;
    });
  }

  onVideoMuted (bool? val) {
    setState(() {
      isVideoMuted = val!;
    });
  }

}
