import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_video_model.dart';
export 'onboarding_video_model.dart';

class OnboardingVideoWidget extends StatefulWidget {
  const OnboardingVideoWidget({super.key});

  @override
  State<OnboardingVideoWidget> createState() => _OnboardingVideoWidgetState();
}

class _OnboardingVideoWidgetState extends State<OnboardingVideoWidget> {
  late OnboardingVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingVideoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OnboardingVideo'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ONBOARDING_VIDEO_OnboardingVideo_ON_INIT');
      logFirebaseEvent('OnboardingVideo_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 59000),
        callback: (timer) async {
          logFirebaseEvent('OnboardingVideo_navigate_back');
          context.safePop();
        },
        startImmediately: false,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FlutterFlowVideoPlayer(
                  path:
                      'https://firebasestorage.googleapis.com/v0/b/urbaneyes-a6d94.appspot.com/o/urban_eyes_onboarding.mp4?alt=media&token=4dd5a6e1-b244-4b35-97ec-3e63ce626f9b',
                  videoType: VideoType.network,
                  autoPlay: true,
                  looping: true,
                  showControls: false,
                  allowFullScreen: false,
                  allowPlaybackSpeedMenu: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
