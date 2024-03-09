import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Profile'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 160.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00E717), Color(0xFF00FFF0)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              currentUserEmail,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('PROFILE_РЕДАКТИРОВАТЬ_ПРОФИЛЬ_BTN_ON_TAP');
                logFirebaseEvent('Button_navigate_to');

                context.pushNamed('EditProfile');
              },
              text: FFLocalizations.of(context).getText(
                '898n1ej4' /* Редактировать профиль */,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: EdgeInsets.all(0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Colors.white,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w300,
                      useGoogleFonts: false,
                    ),
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primaryText,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('PROFILE_ФОРМА_ОБРАТНОЙ_СВЯЗИ_BTN_ON_TAP');
                logFirebaseEvent('Button_navigate_to');

                context.pushNamed('Feedback');
              },
              text: FFLocalizations.of(context).getText(
                'b7er5pp3' /* Форма обратной связи */,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: EdgeInsets.all(0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w300,
                      useGoogleFonts: false,
                    ),
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primaryText,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          if (valueOrDefault<bool>(currentUserDocument?.isAdmin, false))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('PROFILE_PAGE_АДМИН_ПАНЕЛЬ_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed('AdmiPannel');
                  },
                  text: FFLocalizations.of(context).getText(
                    'r26iwyuy' /* Админ панель */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsets.all(0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w300,
                          useGoogleFonts: false,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 40.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('PROFILE_PAGE_ВЫХОД_BTN_ON_TAP');
                logFirebaseEvent('Button_auth');
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth('MainAuth', context.mounted);
              },
              text: FFLocalizations.of(context).getText(
                'ef4p4cwl' /* Выход */,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryText,
                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      useGoogleFonts: false,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primaryText,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
