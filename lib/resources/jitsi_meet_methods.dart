import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/resources/auth_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();

  Future<void> createNewMeeting({required String roomName, required bool isAudioMuted, required bool isVideoMuted}) async {
    try {
      var jitsiMeet = JitsiMeet();
      var options = JitsiMeetConferenceOptions(
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          "subject": roomName
        },
        featureFlags: {
          "unsaferoomwarning.enabled": false,
          "ios.screensharing.enabled": true
        },
        room: roomName,
        userInfo: JitsiMeetUserInfo(
          displayName: _authMethods.user.displayName,
          email: _authMethods.user.email,
          avatar: _authMethods.user.photoURL
        ),
      );
      await jitsiMeet.join(options);
    } catch(e) {
      print(e.toString());
    }
  }
}
