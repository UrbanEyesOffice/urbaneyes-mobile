import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_auth_model.dart';
export 'main_auth_model.dart';

class MainAuthWidget extends StatefulWidget {
  const MainAuthWidget({super.key});

  @override
  State<MainAuthWidget> createState() => _MainAuthWidgetState();
}

class _MainAuthWidgetState extends State<MainAuthWidget> {
  late MainAuthModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainAuthModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MainAuth'});
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
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Bishkek.png',
                    ).image,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Asset_2.png',
                                      width: 31.0,
                                      height: 24.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '38v6jlv3' /* UrbanEyes */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Gerbera',
                                            color: Color(0xFF06112E),
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 30.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAIN_AUTH_PAGE_Row_6mj312h8_ON_TAP');
                                    logFirebaseEvent('Row_action_block');
                                    await action_blocks.changeLanguage(context);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.language_sharp,
                                        color: Color(0xFF06112E),
                                        size: 24.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'qcqoiitg' /* Рус */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Golos',
                                              color: Color(0xFF06112E),
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 30.0, 30.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '4h6zkdv5' /* Помоги своему городу стать луч... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Gerbera',
                                            color: Color(0xFF06112E),
                                            fontSize: 40.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '8ddypxau' /* Проходи опросы и вноси вклад 
... */
                                        ,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Golos',
                                            color: Color(0xFF06112E),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 32.0, 0.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MAIN_AUTH_ВОЙТИ_ЧЕРЕЗ_GOOGLE_BTN_ON_TAP');
                                  logFirebaseEvent('Button_auth');
                                  GoRouter.of(context).prepareAuthEvent();
                                  final user = await authManager
                                      .signInWithGoogle(context);
                                  if (user == null) {
                                    return;
                                  }
                                  if (valueOrDefault<bool>(
                                          currentUserDocument?.isNotFirstLogin,
                                          false) ==
                                      true) {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamedAuth(
                                        'HomePageCopy', context.mounted);
                                  } else {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamedAuth(
                                        'CualificatedSurvey', context.mounted);
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  '979366sj' /* Войти через Google */,
                                ),
                                icon: FaIcon(
                                  FontAwesomeIcons.google,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 56.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF06112E),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Golos',
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            isAndroid
                                ? Container()
                                : Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'MAIN_AUTH_ВОЙТИ_ЧЕРЕЗ_APPLE_BTN_ON_TAP');
                                        logFirebaseEvent('Button_auth');
                                        GoRouter.of(context).prepareAuthEvent();
                                        final user = await authManager
                                            .signInWithApple(context);
                                        if (user == null) {
                                          return;
                                        }
                                        if (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.isNotFirstLogin,
                                                false) ==
                                            true) {
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamedAuth(
                                              'HomePageCopy', context.mounted);
                                        } else {
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamedAuth(
                                              'CualificatedSurvey',
                                              context.mounted);
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'b5vady0x' /* Войти через Apple */,
                                      ),
                                      icon: FaIcon(
                                        FontAwesomeIcons.apple,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 56.0,
                                        padding: EdgeInsets.all(0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF06112E),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Golos',
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '3szbi2zr' /* или */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Golos',
                                    color: Color(0xFF7B7F87),
                                    fontSize: 16.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MAIN_AUTH_PAGE_Button-Login_ON_TAP');
                                  logFirebaseEvent('Button-Login_navigate_to');

                                  context.pushNamed('CreateAccount');
                                },
                                text: FFLocalizations.of(context).getText(
                                  '5uy1dq7o' /* Создать аккаунт */,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 56.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF53B153),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Golos',
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 80.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '61xk9ahq' /* Уже есть аккаунт? */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Golos',
                                          color: Color(0xFF06112E),
                                          fontSize: 18.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'MAIN_AUTH_PAGE_Text_3yh8nidz_ON_TAP');
                                        logFirebaseEvent('Text_navigate_to');

                                        context.pushNamed('Login');
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '0xh4b40q' /* Войти */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Golos',
                                              color: Color(0xFF06112E),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
