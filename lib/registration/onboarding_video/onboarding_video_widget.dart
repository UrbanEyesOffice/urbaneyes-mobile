import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_video_model.dart';
export 'onboarding_video_model.dart';

class OnboardingVideoWidget extends StatefulWidget {
  const OnboardingVideoWidget({super.key});

  @override
  State<OnboardingVideoWidget> createState() => _OnboardingVideoWidgetState();
}

class _OnboardingVideoWidgetState extends State<OnboardingVideoWidget>
    with TickerProviderStateMixin {
  late OnboardingVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

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
        duration: Duration(milliseconds: 57000),
        callback: (timer) async {
          logFirebaseEvent('OnboardingVideo_widget_animation');
          if (animationsMap['buttonOnActionTriggerAnimation'] != null) {
            await animationsMap['buttonOnActionTriggerAnimation']!
                .controller
                .forward(from: 0.0);
          }
        },
        startImmediately: false,
      );
    });

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 140.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
          child: Stack(
            children: [
              Column(
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
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'ONBOARDING_VIDEO_PAGE_closeButton_ON_TAP');
                      logFirebaseEvent('closeButton_navigate_back');
                      context.safePop();
                    },
                    text: FFLocalizations.of(context).getText(
                      'btdgpc21' /* Закрыть */,
                    ),
                    options: FFButtonOptions(
                      width: 330.0,
                      height: 48.0,
                      padding: EdgeInsets.all(0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF53B153),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Golos',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['buttonOnActionTriggerAnimation']!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
